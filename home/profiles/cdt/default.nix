{
  imports = [
    ../../terminal/programs/xdg.nix
    ../../terminal/programs/yazi
    ../../terminal/programs/nyaa.nix

    # editors
    ../../editors/helix

    ../../programs
    ../../programs/wayland
    ../../programs/webcord.nix

    ../../programs/prismlauncher.nix

    # services
    ../../services/wayland/hyprpaper.nix
    ../../services/ags

    # terminal emulators
    ../../terminal/emulators/foot.nix
    ../../terminal/emulators/wezterm

    ../../theming.nix
  ];

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "DP-1, preferred, 0x0, 1"
      "DP-2, preferred, -1920x-360,2,transform,2"
      "DP-3, preferred, -1900x720, 1"
      #"HDMI-A-1, preferred, -1920x0,2"
      #"DP-2, preferred, -1920x0,2"
    ];
  };
  home.file = {
    ".local/bin" = {
      enable = true;
      source = ./bin;
      recursive = true;
    };
  };

  home.sessionPath = ["/home/cooper/.local/bin"];
}
