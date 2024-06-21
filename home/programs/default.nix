{pkgs, ...}: {
  imports = [
    ./anyrun
    ./browsers/chromium.nix
    ./media
    ./gtk
    ./qbittorrent.nix
    ./gnome
  ];

  home.packages = with pkgs; [
    mangohud
  ];
}
