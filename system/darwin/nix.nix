{pkgs, ...}: {
  services.nix-daemon.enable = true;

  environment.systemPackages = with pkgs; [
    cachix
  ];
}
