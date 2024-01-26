{ self, ...}:

{
  flake = {
    homeModules = {    
      common = {
        imports = [
          ./common
        ];
      };

      linux = {
        imports = [
          self.inputs.anyrun.homeManagerModules.default
          ./nixos/hyprland
          ./nixos/chromium
          ./nixos/terminal/emulator/foot.nix
          ./nixos/mpv
          ./nixos/gtk.nix
          ./nixos/services/hyprpaper.nix
        ];
      };

      darwin = {
        
      };
    }; 
  };
}
