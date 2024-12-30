{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      (google-fonts.override {fonts = ["Inter"];})
      liberation_ttf
      jetbrains-mono

      pkgs.nerd-fonts.symbols-only
    ];

    enableDefaultPackages = false;

    fontconfig.defaultFonts = {
      serif = ["Noto Serif"];
      sansSerif = ["Noto Sans"];
      monospace = ["JetBrains Mono" "Noto Color Emoji"];
      emoji = ["Noto Color Emoji"];
    };
  };
}
