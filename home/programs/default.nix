{pkgs, ...}: {
  imports = [
    ./anyrun
    ./browsers/chromium.nix
    ./browsers/librewolf.nix
    ./media
    ./gtk
    ./gui.nix
    ./qbittorrent.nix
    ./gnome
    ./zathura.nix
  ];
}
