{pkgs, ...}: {
  # graphics drivers / HW accel
  hardware.graphics = {
    enable = true;

    extraPackages = with pkgs; [
      libva
    ];
  };
}
