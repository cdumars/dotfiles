# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [];

  boot.initrd.availableKernelModules = ["ata_piix" "vmw_pvscsi" "sd_mod" "sr_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = [];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/2444f17d-4afb-4734-b3d1-b1e66783c503";
    fsType = "btrfs";
    options = ["subvol=root"];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/2444f17d-4afb-4734-b3d1-b1e66783c503";
    fsType = "btrfs";
    options = ["subvol=home"];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/2444f17d-4afb-4734-b3d1-b1e66783c503";
    fsType = "btrfs";
    options = ["subvol=nix"];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/84BE-8191";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };

  swapDevices = [];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.ens192.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
