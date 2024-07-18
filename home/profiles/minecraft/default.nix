{ pkgs, lib, ... }: {
  imports = [
    ../../terminal/shell
    ../../terminal/programs/cli.nix
    ../../terminal/programs/git.nix
  ];
  
  home = {
    username = "minecraft";

    homeDirectory = "/home/minecraft";

    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
