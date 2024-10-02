{pkgs, ...}: {
  imports = [
    ./anyrun
    ./browsers/chromium.nix
    ./media
    ./gtk
    ./gui.nix
    ./qbittorrent.nix
    ./gnome
    ./zathura.nix
  ];
}
