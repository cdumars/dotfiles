{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./binds.nix
    ./config.nix
    ./anyrun
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
    };
  };

  home.packages = [
    inputs.hyprland-contrib.packages.${pkgs.system}.try_swap_workspace
    pkgs.playerctl
  ];
}
