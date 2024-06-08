{pkgs, ...}: {
  imports = [
    ./anyrun
    ./browsers/chromium.nix
    ./media
    ./gtk.nix
    ./qbittorrent.nix
    ./gnome
  ];

  home.packages = with pkgs; [
    mangohud
  ];
}
