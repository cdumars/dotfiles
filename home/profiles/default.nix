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
  };

  inherit (inputs.hm.lib) homeManagerConfiguration;

  pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;

in {
  # we need to pass this to nixos' hm module
  _module.args = {inherit homeImports;};

  flake = {
    homeConfigurations = {
      "cooper_cdt" = homeManagerConfiguration {
        modules = homeImports."cooper@cdt";
        inherit pkgs extraSpecialArgs;
      };
    };
  };
}
