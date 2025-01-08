{pkgs, ...}: {
  xdg.desktopEntries.cider = {
    name = "Cider";
    genericName = "Music Player";
    exec = "${pkgs.appimage-run}/bin/appimage-run /home/cooper/Applications/Cider-x64.AppImage -- %U";
    categories = ["Audio" "AudioVideo" "Network"];
    icon = ./cider.png;
  };
}
