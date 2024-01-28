{
  pkgs,
  self,
  inputs,
  ...
}: {
  imports = [./hardware-configuration.nix];

  security.polkit.enable = true;
  security.sudo.wheelNeedsPassword = false;
  security.rtkit.enable = true;

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "23.11";
}
