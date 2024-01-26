{ self, ...}:

{
  flake = {
    homeModules = {
      common = {
        imports = [
          ./terminal/shell
          ./terminal/programs
        ];
      };

      linux = {
        
      };

      darwin = {
        
      };
    }; 
  };
}
