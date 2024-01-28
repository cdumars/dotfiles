{pkgs, ...}: {
  # graphics drivers / HW accel
  hardware.opengl = {
    enable = true;

    extraPackages = with pkgs; [
      libva
    ];
  };
}
