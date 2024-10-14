{
  pkgs,
  config,
  ...
}: {
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 32;
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;

    font = {
      name = "Inter";
      package = pkgs.google-fonts.override {fonts = ["Inter"];};
      size = 12;
    };

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";

    iconTheme = {
      name = "WhiteSur";
      package = pkgs.whitesur-icon-theme;
    };

#    theme = {
#      package = pkgs.colloid-gtk-theme.override {
#        themeVariants = [ "default" ];
#        colorVariants = [ "dark" ];
#        sizeVariants = [ "standard" ];
#        tweaks = [ "catppuccin" ];
#      };
#      name = "Colloid-Dark-Catppuccin";
#    };

#    theme = {
#      name =
#        if config.theme.name == "light"
#        then "catppuccin-latte-blue-standard+default"
#        else "catppuccin-mocha-blue-standard+default";
      # for some reason the theme wont build from nixpkgs
      #package = inputs.catppuccin-nixpkgs.legacyPackages.${pkgs.system}.catppuccin-gtk.override {
      #  variant =
      #    if config.theme.name == "light"
      #    then "latte"
      #    else "mocha";
      #};
#    };
  };
#  home.sessionVariables = {
#    GTK_THEME = "catppuccin-mocha-blue-standard+default";
#  };

  home.file.".local/share/themes" = {
    enable = true;
    source = ./themes;
    recursive = true;
  };

#  home.packages = [
#    pkgs.custom.gtk-theme-catppuccin
#  ];
}
