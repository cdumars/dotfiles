{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.fish = {
    enable = true;

    plugins = [
      {
        name = "fisher";
        src = pkgs.fetchFromGitHub {
          owner = "jorgebucaran";
          repo = "fisher";
          rev = "2efd33ccd0777ece3f58895a093f32932bd377b6";
          hash = "sha256-e8gIaVbuUzTwKtuMPNXBT5STeddYqQegduWBtURLT3M=";
        };
      }
      {
        name = "bass";
        src = pkgs.fetchFromGitHub {
          owner = "edc";
          repo = "bass";
          rev = "79b62958ecf4e87334f24d6743e5766475bcf4d0";
          hash = "sha256-3d/qL+hovNA4VMWZ0n1L+dSM1lcz7P5CQJyy+/8exTc=";
        };
      }
    ];

    functions = {
      # function has been added to fish nixpkgs
      # yy = {
      #   body = ''
      #     set tmp (mktemp -t "yazi-cwd.XXXXXX")
      #     yazi $argv --cwd-file="$tmp"
      #     if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
      #       cd -- "$cwd"
      #     end
      #     rm -f "$tmp"
      #   '';
      # };

      anime = {
        body = ''
          set p (find /mnt/Bruh/Anime -type d | fzf | string trim)
          if test -n "$p"
            mpv "$p"
          end
        '';
      };
    };

    shellAliases =
      {
        grep = "grep --color";
        ip = "ip --color";
        l = "eza -l";
        la = "eza -la";
        tree = "eza -T";
        lf = "yazi";
        md = "mkdir -p";
        rm = "trash-put";
        "7z" = "7zz";
        y = "yazi";

        sudo = "doas";
        us = "systemctl --user";
        rs = "doas systemctl";

        dots = "cd ~/Documents/dotfiles/";
        fetch = "fastfetch -c neofetch.jsonc";
        ufetch = "fastfetch -c examples/8.jsonc";
      }
      // lib.optionalAttrs (config.programs.bat.enable == true) {cat = "bat";};
  };
}
