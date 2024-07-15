{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      # set cursor for HL itself
      #"hyprctl setcursor ${pointer.name} ${toString pointer.size}"
      #"systemctl --user start clight"
      #fix theme in file picker
      "dbus-update-activation-environment --systemd --all"
      "systemctl --user import-environment PATH"
      "systemctl --user restart xdg-desktop-portal.service"
      "foot --server"
      "swaylock"
    ];

    general = {
      gaps_in = 5;
      gaps_out = 5;
      border_size = 1;
      "col.active_border" = "rgba(88888888)";
      "col.inactive_border" = "rgba(00000088)";

      allow_tearing = true;
      resize_on_border = true;
    };

    cursor = {
      # hide cursor after x seconds
      inactive_timeout = 3;
    };

    decoration = {
      rounding = 16;
      blur = {
        enabled = true;
        brightness = 1.0;
        contrast = 1.0;
        noise = 0.02;

        passes = 3;
        size = 10;
      };

      drop_shadow = true;
      shadow_ignore_window = true;
      shadow_offset = "0 2";
      shadow_range = 20;
      shadow_render_power = 3;
      "col.shadow" = "rgba(00000055)";
    };

    animations = {
      enabled = true;
      animation = [
        "border, 1, 2, default"
        "fade, 1, 4, default"
        "windows, 1, 3, default, popin 80%"
        "workspaces, 1, 2, default, slide"
      ];
    };

    group = {
      groupbar = {
        font_size = 16;
        gradients = false;
      };
    };

    input = {
      kb_layout = "ro";

      # focus change on cursor move
      follow_mouse = 1;
      accel_profile = "flat";
      touchpad.scroll_factor = 0.1;
    };

    dwindle = {
      # keep floating dimentions while tiling
      pseudotile = true;
      preserve_split = true;
    };

    misc = {
      # enable auto polling for config file changes
      disable_autoreload = false;

      force_default_wallpaper = 0;

      # disable dragging animation
      animate_mouse_windowdragging = false;

      # enable variable refresh rate (effective depending on hardware)
      vrr = 1;

      # we do, in fact, want direct scanout
      no_direct_scanout = false;

      # window swallowing -- how can you live without this?
      enable_swallow = true;
      swallow_regex = "^(org.wezfurlong.wezterm|foot|footclient)$";
    };

    xwayland.force_zero_scaling = true;

    env = [
      "GDK_SCALE,2"
      "XCURSOR_SIZE,32"
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
      "WLR_DRM_NO_ATOMIC,1"
    ];

    debug.disable_logs = false;
  };
}
