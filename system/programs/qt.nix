{pkgs, ...}: {
  qt = {
    enable = true;
    platformTheme = "qt5ct";
  };

  environment.systemPackages = [
    pkgs.qt6ct
    pkgs.catppuccin-qt5ct
  ];
}
