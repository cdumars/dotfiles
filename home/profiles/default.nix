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
  };

  inherit (inputs.hm.lib) homeManagerConfiguration;

  pkgs = inputs.nixpkgs.legacyPackages.${self.pkgs.system};

in {
  # we need to pass this to nixos' hm module
  _module.args = {inherit homeImports;};

  flake = {
    homeConfigurations = {
      "cooper_cdt" = homeManagerConfiguration {
        modules = homeImports."cooper@cdt";
        inherit pkgs extraSpecialArgs;
      };

      "cooper_clt" = homeManagerConfiguration {
        modules = homeImports."cooper@clt";
        inherit pkgs extraSpecialArgs;
      };
    };
  };
}
