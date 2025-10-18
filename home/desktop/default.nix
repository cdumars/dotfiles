{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./cider
  ];

  xdg.desktopEntries.irony-mod-manager = {
    name = "Irony Mod Manager";
    genericName = "Mod Manager";
    exec = "${lib.getExe pkgs.custom.IronyModManager}";
    categories = ["X-Games"];
    icon = ./irony-mod-manager.png;
  };
}
