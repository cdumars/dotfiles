{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nushell

    tree
    jq
    htop
  ];

  programs.fish.enable = true;
}
