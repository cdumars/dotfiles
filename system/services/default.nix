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

    # UDISKS
    udisks2.enable = true;
  };
  # DOCKER
  virtualisation.docker = {
    enable = true;
    enableOnBoot = false;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    ostree
    appstream-glib
  ];
}
