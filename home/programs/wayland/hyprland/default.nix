{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./binds.nix
    ./config.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;

    # conflicts with UWSM
    systemd.enable = false;

    settings = {
      "$mod" = "SUPER";
    };
  };

  home.packages = [
    inputs.hyprland-contrib.packages.${pkgs.system}.try_swap_workspace
    pkgs.playerctl
  ];
}
