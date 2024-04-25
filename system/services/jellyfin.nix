{pkgs, lib, ...}: {
  services.jellyfin.enable = true;
  systemd.services.jellyfin.wantedBy = lib.mkForce [];
  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];
}
