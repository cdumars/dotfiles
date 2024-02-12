{
  self,
  inputs,
  homeImports,
  ...
}: {
  flake.nixosConfigurations = let
    # shorten paths
    inherit (inputs.nixpkgs.lib) nixosSystem;
    mod = "${self}/system";

    # get the basic config to build on top of
    inherit (import "${self}/system") desktop;

    # get these into the module system
    specialArgs = {inherit inputs self;};

    # fenix
    packages.${self.pkgs.system}.default = inputs.fenix.packages.${self.pkgs.system}.default.toolchain;
  in {
    cdt = nixosSystem {
      inherit specialArgs;
      modules =
        desktop
        ++ [
          ./cdt
          "${mod}/programs/hyprland.nix"
          "${mod}/programs/steam.nix"

          {
            home-manager = {
              users.cooper.imports = homeImports."cooper@cdt";
              extraSpecialArgs = specialArgs;
            };
          }
        ];
    };
  };
}
