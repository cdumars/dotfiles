{
  catppuccin = {
    flavor = "mocha";
    accent = "blue";
    enable = true;
  };

  qt.enable = true;
  qt.style.catppuccin.enable = true;
  qt.style.name = "kvantum";
  qt.style.catppuccin.apply = true;
  qt.platformTheme.name = "kvantum";
  gtk.catppuccin.enable = true;

  programs.swaylock.catppuccin.enable = false;
  programs.yazi.catppuccin.enable = false;
}
