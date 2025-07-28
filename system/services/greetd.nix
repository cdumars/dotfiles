{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  # greetd display manager
  services.greetd = let
    hypr-run = let
      hyprland = pkgs.hyprland; #inputs.hyprland.packages.${pkgs.system}.default;
    in (pkgs.writeShellScriptBin "hypr-run" ''
      export XDG_SESSION_TYPE="wayland"
      export XDG_SESSION_DESKTOP="Hyprland"
      export XDG_CURRENT_DESKTOP="Hyprland"

      #systemd-run --user --scope --collect --quiet --unit="hyprland" \
      #  systemd-cat --identifier="hyprland" ${hyprland}/bin/Hyprland $@

      #${hyprland}/bin/hyprctl dispatch exit

      exec ${pkgs.uwsm}/bin/uwsm start -S hyprland-uwsm.desktop
    '');

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
