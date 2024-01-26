{ inputs, pkgs, ... }:

{
  programs.anyrun = {
    enable = true;

    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        shell
      ];

      width = { fraction = 0.3; };
      y.absolute = 15;
      hidePluginInfo = true;
      closeOnClick = true;
  };

  extraCss = builtins.readFile(./style-dark.css);

  extraConfigFiles."applications.run".text = ''
    Config(
      desktop_actions: false,
      max_entries: 5,
      terminal: Some("foot"),
    )
  '';
  };
}
