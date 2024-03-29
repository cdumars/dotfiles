{pkgs, ...}: let
  colors = {
    dark = {
      foreground = "cdd6f4"; # Text
      background = "1e1e2e"; # Base
      regular0 = "45475a"; # Surface 1
      regular1 = "f38ba8"; # red
      regular2 = "a6e3a1"; # green
      regular3 = "f9e2af"; # yellow
      regular4 = "89b4fa"; # blue
      regular5 = "f5c2e7"; # maroon
      regular6 = "94e2d5"; # teal
      regular7 = "bac2de"; # Subtext 1
      bright0 = "585b70"; # Surface 2
      bright1 = "f38ba8"; # red
      bright2 = "a6e3a1"; # green
      bright3 = "f9e2af"; # yellow
      bright4 = "89b4fa"; # blue
      bright5 = "f5c2e7"; # maroon
      bright6 = "94e2d5"; # teal
      bright7 = "a6adc8"; # Subtext 0
    };
  };
in {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "monospace:size=12";
        box-drawings-uses-font-glyphs = "yes";
        pad = "8x8 center";
        notify = "notify-send -a \${app-id} -i \${app-id} \${title} \${body}";
        selection-target = "clipboard";
      };
      scrollback = {
        lines = 10000;
        multiplier = 3;
      };

      url = {
        launch = "xdg-open \${url}";
        label-letters = "sadfjklewcmpgh";
        osc8-underline = "url-mode";
        protocols = "http, https, ftp, ftps, file";
        uri-characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_.,~:;/?#@!$&%*+=\"'()[]";
      };

      cursor = {
        style = "beam";
        beam-thickness = 1;
      };

      colors =
        {
          alpha = 0.9;
        }
        // colors.dark;
    };
  };
}
