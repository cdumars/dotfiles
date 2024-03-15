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
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "usbhid" "usb_storage" "uas"];
  boot.initrd.kernelModules = ["amdgpu"];
  boot.kernelModules = ["kvm-amd"];
  boot.extraModulePackages = [
    # build error as of 14 Mar 2024
    #config.boot.kernelPackages.vendor-reset
  ];

  boot.kernelParams = [
    "video=DP-1:1920x1080@240"
    "video=DP-2:3640x2180@60"
  ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/31db9e97-7677-4292-a6b9-2ac8246752b2";
    fsType = "btrfs";
    options = ["subvol=nix_root" "compress=zstd"];
  };

  boot.initrd.luks.devices."crypt".device = "/dev/disk/by-uuid/d76a081a-af0f-47b6-b16c-3dee4c17db27";

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/31db9e97-7677-4292-a6b9-2ac8246752b2";
    fsType = "btrfs";
    options = ["subvol=nix_home" "compress=zstd"];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/31db9e97-7677-4292-a6b9-2ac8246752b2";
    fsType = "btrfs";
    options = ["subvol=nix" "compress=zstd"];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/373B-E7AC";
    fsType = "vfat";
  };

  fileSystems."/mnt/Big" = {
    device = "/dev/disk/by-uuid/aaae2721-a459-4bf7-b69d-be04b4dae5cf";
    fsType = "btrfs";
    options = ["compress=zstd"];
  };

  fileSystems."/mnt/Bruh" = {
    device = "/dev/disk/by-uuid/a663013e-eeb1-456a-848d-3f2022fb157d";
    fsType = "btrfs";
    options = ["compress=zstd"];
  };

  swapDevices = [];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp5s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp6s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
