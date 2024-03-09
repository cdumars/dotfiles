{
  pkgs,
  config,
  ...
}: {
  boot = {
    initrd = {
      systemd.enable = true;
      supportedFilesystems = ["btrfs"];
    };

    kernelPackages = pkgs.linuxPackages_zen;

    consoleLogLevel = 3;
    kernelParams = [
      #      "quiet"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
    ];

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };

    #    plymouth.enable = true;
  };
}
