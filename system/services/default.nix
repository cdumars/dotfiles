{pkgs, ...}: {
  services = {
    dbus.implementation = "broker";

    # profile-sync-daemon
    psd = {
      enable = true;
      resyncTimer = "10m";
    };

  # FLATPAK
  flatpak.enable = true;
  };
  environment.systemPackages = with pkgs; [
    ostree
    appstream-glib
  ];
}
