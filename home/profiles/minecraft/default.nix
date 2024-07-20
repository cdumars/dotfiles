{ self, pkgs, lib, ... }: {
  imports = [
    ../../terminal/shell
    ../../terminal/programs/git.nix
    self.nixosModules.theme
  ];
  
  home = {
    username = "minecraft";

    homeDirectory = "/home/minecraft";

    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
