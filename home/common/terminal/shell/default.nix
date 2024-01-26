{ pkgs, ... }:

{
  imports = [
    ./completions.nix
    ./nushell
  ];
  programs.fish.enable = true;

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    settings = {
      add_newline = false;
    };
  };
}
