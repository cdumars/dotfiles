{
  imports = [
    ../../terminal/programs/xdg.nix

    # editors
    ../../editors/helix

    ../../programs
    ../../programs/wayland

    ../../programs/prismlauncher.nix

    # services
    ../../services/wayland/hyprpaper.nix
    ../../services/ags

    # terminal emulators
    ../../terminal/emulators/foot.nix
    ../../terminal/emulators/wezterm.nix
  ];

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "DP-1, preferred, 0x0, 1"
      "DP-2, preferred, -1920x-360,2,transform,2"
    ];
  };
}
