{pkgs, ...}: {
  imports = [
    ./mpv
  ];

  home.packages = with pkgs; [
    # audio control
    pavucontrol
    pulsemixer

    # images
    imv
  ];
}
