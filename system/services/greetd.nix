{
  config,
  lib,
  pkgs,
  ...
}: {
  # greetd display manager
  services.greetd = let
    hypr-run = pkgs.writeShellScriptBin "hypr-run" ''
      export XDG_SESSION_TYPE="wayland"
      export XDG_SESSION_DESKTOP="Hyprland"
      export XDG_CURRENT_DESKTOP="Hyprland"

      systemd-run --user --scope --collect --quiet --unit="hyprland" \
        systemd-cat --identifier="hyprland" ${pkgs.hyprland}/bin/Hyprland $@

      ${pkgs.hyprland}/bin/hyprctl dispatch exit
    '';

    session = {
      command = "${lib.getExe hypr-run}";
      user = "cooper";
    };
  in {
    enable = true;
    settings = {
      terminal.vt = 1;
      default_session = session;
      initial_session = session;
    };
  };

  # unlock GPG keyring on login
  security.pam.services.greetd.enableGnomeKeyring = true;
}
