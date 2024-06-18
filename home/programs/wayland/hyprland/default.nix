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
    settings = {
      "$mod" = "SUPER";
    };
  };

  home.packages = [
    inputs.hyprland-contrib.packages.${pkgs.system}.try_swap_workspace
    pkgs.playerctl
  ];
}
