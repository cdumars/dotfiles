{
  self,
  inputs,
  homeImports,
  ...
}: {
  flake = let
    # shorten paths
    inherit (inputs.nixpkgs.lib) nixosSystem;
    inherit (inputs.nix-darwin.lib) darwinSystem;
    mod = "${self}/system";

    # get the basic config to  build on top of
    inherit (import mod) desktop laptop server;

    # get these into the module system
    specialArgs = {inherit inputs self;};

  in {
    nixosConfigurations = {
      cdt = nixosSystem {
        inherit specialArgs;
        modules =
          desktop
          ++ [
            ./cdt
            "${mod}/programs/hyprland.nix"
            "${mod}/programs/games.nix"
            "${mod}/programs/wine.nix"
            "${mod}/services/greetd.nix"
            "${mod}/services/jellyfin.nix"
            "${mod}/services/virtualisation.nix"
            "${mod}/languages/rust.nix"
            "${mod}/nix/nix-ld.nix"
            "${mod}/programs/matlab.nix"
            
            inputs.nixos-cli.nixosModules.nixos-cli
            "${mod}/nix/nixos-cli.nix"

            {
              home-manager = {
                users.cooper.imports = homeImports."cooper@cdt";
                extraSpecialArgs = specialArgs;
              };
            }
          ];
      };
      minecraft = nixosSystem {
        inherit specialArgs;
        modules =
          server
          ++ [
            ./minecraft
            "${mod}/programs/java.nix"

            {
              home-manager = {
                users.minecraft.imports = homeImports."minecraft@minecraft";
                extraSpecialArgs = specialArgs;
              };
            }
          ];
      };
    };

    darwinConfigurations = {
      clt = darwinSystem {
        inherit specialArgs;
        modules =
          laptop
          ++ [
            ./clt

            {
              home-manager = {
                users.cooper.imports = homeImports."cooper@clt";
                extraSpecialArgs = specialArgs;
              };
            }
          ];
      };
    };
  };
}
