{pkgs, ...}: {
  qt = {
    enable = true;
  };

  environment.systemPackages = [
    pkgs.qt6.qtwayland
  ];
}
