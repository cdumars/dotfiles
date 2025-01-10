{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.anyrun.homeManagerModules.default
  ];

  programs.anyrun = {
    enable = true;

    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        #crashes on new version of hyprland for some reason -- should check out
        #randr
        shell
        symbols
        rink
      ];

      width.fraction = 0.3;
      y.absolute = 15;
      hidePluginInfo = true;
      closeOnClick = true;
    };

    extraCss = builtins.readFile (./. + "/style-${config.theme.name}.css");

    extraConfigFiles."applications.ron".text = ''
      Config(
        desktop_actions: false,
        max_entries: 5,
        terminal: Some(Terminal(
          command: "wezterm",
          args: "start {}",
        )),
        app_launch_prefix: Some("uwsm app --")
      )
    '';
  };
}
