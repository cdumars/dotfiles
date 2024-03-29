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

    shellAliases =
      {
        grep = "grep --color";
        ip = "ip --color";
        l = "eza -l";
        la = "eza -la";
        lf = "yazi";
        md = "mkdir -p";

        us = "systemctl --user";
        rs = "sudo systemctl";
      }
      // lib.optionalAttrs (config.programs.bat.enable == true) {cat = "bat";};
  };
}
