{
  lib,
  self,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./specialisations.nix
    ./terminal
    self.nixosModules.theme
    inputs.matugen.nixosModules.default
  ];

  home = {
    username = "cooper";

    homeDirectory = let
      dir = if pkgs.system == "x86_64-darwin"
        then lib.mkForce "/Users/cooper"
        else "/home/cooper";
    in dir;
    
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
