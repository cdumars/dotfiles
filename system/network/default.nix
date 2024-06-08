{lib, ...}:
# networking configuration
{
  networking.networkmanager = {
    enable = true;
    #    dns = "systemd-resolved";
  };

  networking.firewall = {
    enable = false;
    allowedTCPPorts = [22 80 443 5000 5900 8000 8080 8096];
  };

  services = {
    openssh = {
      enable = true;
      #      settings.UseDns = true;
    };

    # DNS resolver
    #    resolved.enable = true;
  };

  # Don't wait for network startup
  # systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;
}
