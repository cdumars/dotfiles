{pkgs, ...}:

{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      (google-fonts.override {fonts = ["Inter"];})
      liberation_ttf

      (nerdfonts.override {fonts = ["NerdFontsSymbolsOnly"];})
    ];

    enableDefaultPackages = false;

    fontconfig.defaultFonts = {
      serif = ["Noto Serif"];
      sansSerif = ["Noto Sans"];
      monospace = ["Liberation Mono" "Noto Color Emoji"];
      emoji = ["Noto Color Emoji"];
    };
  };
}
