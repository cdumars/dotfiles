{
  pkgs,
  lib,
  config,
  ...
}: {
  # light/dark specialisations
  specialisation = let
    colorschemePath = "/org/gnome/desktop/interface/color-scheme";
    dconf = "${pkgs.dconf}/bin/dconf";

    dconfDark = lib.hm.dag.entryAfter ["dconfSettings"] ''
      ${dconf} write ${colorschemePath} "'prefer-dark'"
    '';
    dconfLight = lib.hm.dag.entryAfter ["dconfSettings"] ''
      ${dconf} write ${colorschemePath} "'prefer-light'"
    '';
  in {
    light.configuration = {
      theme.name = "light";
      home.activation = {inherit dconfLight;};
    };
    dark.configuration = {
      theme.name = "dark";
      home.activation = {inherit dconfDark;};
    };
    two-monitor.configuration = {
      wayland.windowManager.hyprland.settings = {
        monitor = [
          "DP-1, preferred, 0x0, 1"
          "DP-2, preferred, -1920x0,2"
        ];
      };
    };
  };

  theme = {
    wallpaper = let
      params = "";
      url = "https://9to5mac.com/wp-content/uploads/sites/6/2022/06/macOS-Graphic-Dark.jpg${params}";
      sha256 = "2bd31217f596ba4ddca676396eda49610acdd6f424867043dc491db8a270f3ae";
      ext = lib.last (lib.splitString "." url);
    in
      builtins.fetchurl {
        name = "wallpaper-${sha256}.${ext}";
        inherit url sha256;
      };
  };

  programs.matugen = {
    enable = false;
    wallpaper = config.theme.wallpaper;
  };

  #xdg.configFile."qt5ct/colors" = {
  #  enable = true;
  #  recursive = true;
  #  source = "${pkgs.catppuccin-qt5ct}/share/qt5ct/colors";
  #};

  #xdg.configFile."qt6ct/colors" = {
  #  enable = true;
  #  recursive = true;
  #  source = "${pkgs.catppuccin-qt5ct}/share/qt5ct/colors";
  #};
}
