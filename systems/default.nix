{
  flake = {
    nixosModules = {
      common = {
        imports = [
          ./common
        ];
      };

      darwin = {
        security.pam.enableSudoTouchIdAuth = true;
      };

      linux = {
        
      };
    };
  };
}
