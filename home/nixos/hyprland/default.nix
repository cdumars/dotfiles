{
  imports = [
    ./binds.nix 
    ./config.nix
    ./anyrun
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
    };
  };
}
