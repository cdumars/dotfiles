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
    inherit (import mod) desktop laptop;

    # get these into the module system
    specialArgs = {inherit inputs self;};

    # fenix
    packages.${self.pkgs.system}.default = inputs.fenix.packages.${self.pkgs.system}.default.toolchain;
  in {
    nixosConfigurations = {
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
