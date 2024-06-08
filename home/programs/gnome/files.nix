{pkgs, ...}: {
  home.packages = with pkgs; [
    gnome.nautilus
    ffmpegthumbs
    ffmpegthumbnailer
    gnome.file-roller
  ];
}
