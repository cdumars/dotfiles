{
  self,
  inputs,
  ...
}: let
  extraSpecialArgs = {inherit inputs self;};

  homeImports = {
    "cooper@cdt" = [
      ../.
      ./cdt
    ];

    "cooper@clt" = [
      ../.
      ./clt
    ];

    "minecraft@minecraft" = [
      ./minecraft
    ];
  };

  inherit (inputs.hm.lib) homeManagerConfiguration;

  pkgs_nixos = inputs.nixpkgs.legacyPackages.x86_64-linux;
  pkgs_darwin = inputs.nixpkgs.legacyPackages.x86_64-darwin;
in {
  # we need to pass this to nixos' hm module
  _module.args = {inherit homeImports;};

  flake = {
    homeConfigurations = {
      "cooper_cdt" = let
        pkgs = pkgs_nixos;
      in
        homeManagerConfiguration {
          modules = homeImports."cooper@cdt";
          inherit pkgs extraSpecialArgs;
        };

      "minecraft_minecraft" = let
        pkgs = pkgs_nixos;
      in
        homeManagerConfiguration {
          modules = homeImports."minecraft@minecraft";
          inherit pkgs extraSpecialArgs;
        };

      "cooper_clt" = let
        pkgs = pkgs_darwin;
      in
        homeManagerConfiguration {
          modules = homeImports."cooper@clt";
          inherit pkgs extraSpecialArgs;
        };
    };
  };
}
