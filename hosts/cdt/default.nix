{
  pkgs,
  self,
  inputs,
  ...
}: {
  imports = [./hardware-configuration.nix];

  networking.hostName = "cdt";

  security.polkit.enable = true;
  #security.sudo.wheelNeedsPassword = false;
  security.sudo.enable = false;
  security.doas = {
    enable = true;
    extraRules = [
      {
        groups = ["wheel"];
        keepEnv = true;
        noPass = true;
      }
    ];
  };
  security.rtkit.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    # enable ROCM support
    extraPackages = with pkgs; [
      rocmPackages.clr.icd
    ];
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "23.11";
}
