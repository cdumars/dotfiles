{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nushell

    tree
    jq
  ];

  programs.fish.enable = true;
}
