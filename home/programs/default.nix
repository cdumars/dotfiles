{pkgs, ...}: {
  imports = [
    ./anyrun
    ./browsers/chromium.nix
    ./media
    ./gtk
    ./qbittorrent.nix
    ./gnome
  ];
}
