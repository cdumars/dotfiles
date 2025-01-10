{pkgs, ...}: let
  screenshotarea = "uwsm app -- hyprctl keyword animation 'fadeOut,0,0,default'; uwsm app -- ${pkgs.grimblast} --notify copysave area; uwsm app -- hyprctl keyword animation 'fadeOut,1,4,default'";
  workspaces = builtins.concatLists (builtins.genList (
      x: let
        ws = let
          c = (x + 1) / 10;
        in
          builtins.toString (x + 1 - (c * 10));
      in [
        "$mod, ${ws}, workspace, ${toString (x + 1)}"
        "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
      ]
    )
    10);
in {
  wayland.windowManager.hyprland.settings = {
    # mouse movements
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
      "$mod ALT, mouse:272, resizewindow"
    ];

    # binds
    bind = let
      monocle = "dwindle:no_gaps_when_only";
    in
      [
        # compositor commands
        "$mod SHIFT, Q, exec, uwsm stop"
        "$mod SHIFT, W, killactive,"
        "$mod, F, fullscreen, 0"
        "$mod, G, togglegroup,"
        "$mod SHIFT, N, changegroupactive, f"
        "$mod SHIFT, P, changegroupactive, b"
        "$mod, R, togglesplit,"
        "$mod, T, togglefloating,"
        "$mod ALT, P, pseudo,"
        "$mod ALT, ,resizeactive,"

        # toggle "monocle" (no_gaps_when_only)
        "$mod, M, exec, hyprctl keyword ${monocle} $(($(hyprctl getoption ${monocle} -j | jaq -r '.int') ^ 1))"

        # move focus
        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"

        # move windows
        "$mod SHIFT, H, movewindow, l"
        "$mod SHIFT, L, movewindow, r"
        "$mod SHIFT, K, movewindow, u"
        "$mod SHIFT, J, movewindow, d"

        # utility
        # terminal
        "$mod SHIFT, Return, exec, uwsm app -- org.wezfurlong.wezterm.desktop"
        # browser
        "$mod, B, exec, uwsm app -- chromium-browser.desktop"

        # anyrun launcher
        "$mod, P, exec, uwsm app -- anyrun"

        # fake fullscreen

        # screenshot
        # stop animations while screenshotting; makes black border go away
        "$mod SHIFT, S, exec, ${screenshotarea}"
      ]
      ++ workspaces;

    bindr = [
    ];

    bindl = [
      # media controls
      ", XF86AudioPlay, exec, uwsm app -- playerctl play-pause"
      ", XF86AudioPrev, exec, uwsm app -- playerctl previous"
      ", XF86AudioNext, exec, uwsm app -- playerctl next"

      # volume
      ", XF86AudioMute, exec, uwsm app -- wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioMicMute, exec, uwsm app -- wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ];

    bindle = [
      # volume
      ", XF86AudioRaiseVolume, exec, uwsm app -- wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%+"
      ", XF86AudioLowerVolume, exec, uwsm app -- wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%-"

      # backlight
      ", XF86MonBrightnessUp, exec, uwsm app -- brillo -q -u 300000 -A 5"
      ", XF86MonBrightnessDown, exec, uwsm app -- brillo -q -u 300000 -U 5"
    ];
  };
}
