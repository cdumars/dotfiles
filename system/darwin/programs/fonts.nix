{ pkgs, ...}:

{
  fonts = {
    fontDir.enable = true;

    fonts = with pkgs; [
      (google-fonts.override {fonts = ["Inter"];})
      (nerdfonts.override {fonts = ["NerdFontsSymbolsOnly" "LiberationMono" "Iosevka" ];})
    ];
  };
}
