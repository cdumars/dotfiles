{
  inputs = {
    # Principle inputs (updated by `nix run .#update`)
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:lnl7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    flake-parts.url = "github:hercules-ci/flake-parts";
    nixos-flake.url = "github:srid/nixos-flake";

    anyrun.url = "github:Kirottu/anyrun";
    anyrun.inputs.nixpkgs.follows = "nixpkgs";

    hyprpaper.url = "github:hyprwm/hyprpaper";
 };

  outputs = inputs@{ self, ... }:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-darwin" "x86_64-darwin" ];
      imports = [
        inputs.nixos-flake.flakeModule
        ./home
        ./systems
      ];

      flake =
        let
          myUserName = "cooper";
        in
        {
          # Configurations for Linux (NixOS) machines
          nixosConfigurations = {
            cdt = self.nixos-flake.lib.mkLinuxSystem {
              nixpkgs.hostPlatform = "x86_64-linux";
              imports = [
                self.nixosModules.common
                self.nixosModules.linux
                self.nixosModules.theme

                ./systems/cdt

                # TODO move user definition into its own file
                ({ pkgs, ... }: {
                  users.users.${myUserName} = {
                    name = "${myUserName}";
                    home = "/home/${myUserName}";
                    shell = pkgs.fish;
                    isNormalUser = true;
                    extraGroups = [ "users" "wheel" "video" "audio" ];
                  };
                  system.stateVersion = "23.11";

                  home-manager.extraSpecialArgs = {inherit inputs self;};
                })

                self.nixosModules.home-manager
                {
                  home-manager.users.${myUserName} = {
                    imports = [
                      self.homeModules.common
                      self.homeModules.linux
                    ];
                    home.stateVersion = "23.11";
                  };
                }
              ];
            };
          };

          # Configurations for macOS machines
          darwinConfigurations = {
            clt = self.nixos-flake.lib.mkMacosSystem {
              nixpkgs.hostPlatform = "x86_64-darwin";
              imports = [
                self.nixosModules.common # See below for "nixosModules"!
                self.nixosModules.darwin
                # Your machine's configuration.nix goes here
                ({ pkgs, ... }: {
                  # Used for backwards compatibility, please read the changelog before changing.
                  # $ darwin-rebuild changelog
                  services.nix-daemon.enable = true;
                  system.stateVersion = 4;
                  users.users.${myUserName} = {
                    name = "${myUserName}";
                    home = "/Users/${myUserName}";
                    shell = pkgs.fish;
                  };
                })
                # Your home-manager configuration
                self.darwinModules_.home-manager
                {
                  home-manager.users.${myUserName} = {
                    imports = [
                      self.homeModules.common # See below for "homeModules"!
                      self.homeModules.darwin
                    ];
                    home.stateVersion = "23.11";
                  };
                }
              ];
            };
          };
        };
    };
}
