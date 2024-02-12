{config, ...}: let
  data = config.xdg.dataHome;
  conf = config.xdg.configHome;
  cache = config.xdg.cacheHome;
in {
  imports = [
    ./programs
    ./shell/fish.nix
    ./shell/starship.nix
    ./shell/nushell.nix
  ];

  # environment variables
  home.sessionVariables = {
    # clean up
    LESSHISTFILE = "${cache}/less/history";
    LESSKEY = "${conf}/less/lesskey";

    WINEPREFIX = "${data}/wine";
    CARGO_HOME = "${data}/cargo";

    EDITOR = "hx";
    DIRENV_LOG_FORMAT = "";
  };
}
