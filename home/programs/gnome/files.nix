{pkgs, ...}: {
  home.packages = with pkgs; [
    nautilus
    ffmpegthumbs
    ffmpegthumbnailer
    file-roller
  ];
}
