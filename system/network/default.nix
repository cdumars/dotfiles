{lib, pkgs, ...}:
# networking configuration
{
  networking = {
    useDHCP = false;
    networkmanager = {
      enable = true;
      plugins = [
        pkgs.networkmanager-openvpn
      ];
    };

    firewall = {
      enable = false;
    };

    domain = "local";
  };

  services = {
    openssh = {
      enable = true;
      #      settings.UseDns = true;
    };

    # DNS resolver
    resolved.enable = true;
  };

  # Don't wait for network startup
  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;
  systemd.services.NetworkManager = {
    enable = true;
    wants = ["systemd-resolved.service"];
  };
}
