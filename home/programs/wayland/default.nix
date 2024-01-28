{
  pkgs,
  self,
  ...
}: {
  imports = [
    ./hyprland
    ./swaylock.nix
    ./wlogout.nix
  ];

  home.packages = with pkgs; [
    # screenshot
    grim
    slurp

    # utils
    wl-clipboard
    wl-screenrec
    wlr-randr
  ];

  # make stuff work
  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEO_DRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };
}
