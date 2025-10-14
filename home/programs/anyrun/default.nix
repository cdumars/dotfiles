{
  pkgs,
  inputs,
  config,
  lib,
  ...
}: {
  imports = [
    #inputs.anyrun.homeManagerModules.default
  ];

  programs.anyrun = {
    enable = true;
    package = inputs.anyrun.packages.${pkgs.system}.anyrun;

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

    extraConfigFiles."applications.ron".text = let
      preprocess_script = pkgs.writeShellApplication {
        name = "anyrun-preprocess-application-exec";
        runtimeInputs = [];
        text = ''
          shift # Remove term|no-term
          echo "uwsm app -- $*"
        '';
      };
    in ''
      Config(
        desktop_actions: false,
        max_entries: 5,
        terminal: Some(Terminal(
          command: "wezterm",
          args: "start {}",
        )),
        preprocess_exec_script: Some("${lib.getExe preprocess_script}")
      )
    '';
  };
}
