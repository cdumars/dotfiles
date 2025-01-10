{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: {
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ${config.theme.wallpaper}
    wallpaper = , ${config.theme.wallpaper}

    splash = false
  '';

  systemd.user.services.hyprpaper = {
    Unit = {
      Description = "Hyprland wallpaper daemon";
      PartOf = [
        "graphical-session.target"
        "background-graphical.slice"
      ];
    };
    Service = {
      ExecStart = "${lib.getExe pkgs.uwsm} app -- ${lib.getExe inputs.hyprpaper.packages.${pkgs.system}.default}";
      Restart = "on-failure";
    };
    Install.WantedBy = ["graphical-session.target"];
  };

  # wayland.windowManager.hyprland.settings.exec-once = [

  # ];
}
