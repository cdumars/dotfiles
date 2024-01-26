{
  flake = {
    nixosModules = {
      common = {
        imports = [
          ./os/common
          ./specialisations.nix
        ];
      };

      darwin = {
        security.pam.enableSudoTouchIdAuth = true;
      };

      linux = {
        imports = [
          ./os/nixos
        ];
      };

      theme = import ../modules/theme;
    };
  };
}
