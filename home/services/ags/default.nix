{
  inputs,
  lib,
  pkgs,
  config,
  ...
}: let
  pkgs_ = inputs.nixpkgs-old.legacyPackages.${pkgs.system};

  requiredDeps = with pkgs_; [
    config.wayland.windowManager.hyprland.package
    bash
    coreutils
    dart-sass
    gawk
    imagemagick
    procps
    ripgrep
    util-linux
  ];

  guiDeps = with pkgs_; [
    gnome-resources
    mission-center
    overskride
    wlogout
  ];

  dependencies = requiredDeps ++ guiDeps;

  cfg = config.programs.ags;
in {
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  programs.ags.enable = true;

  xdg.configFile."ags" = {
    source = ./config;
    recursive = true;
  };

  systemd.user.services.ags = {
    Unit = {
      Description = "Aylur's Gtk Shell";
      PartOf = [
        "tray.target"
        "graphical-session.target"
        "background-graphical.slice"
      ];
    };
    Service = {
      Environment = "PATH=/run/wrappers/bin:${lib.makeBinPath dependencies}";
      ExecStart = "${lib.getExe pkgs_.uwsm} app -s b -- ${lib.getExe cfg.package}";
      Restart = "on-failure";
    };
    Install.WantedBy = ["graphical-session.target"];
  };
}
