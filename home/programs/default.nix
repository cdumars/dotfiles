{pkgs, ...}: {
  imports = [
    ./anyrun
    ./browsers/chromium.nix
    ./media
    ./gtk.nix
    ./qbittorrent.nix
  ];

  home.packages = with pkgs; [
    mangohud
  ];
}
