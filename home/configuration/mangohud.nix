{lib, ...}: {
  programs.mangohud = {
    enable = true;

    settings = lib.mkForce {
      gpu_stats = true;
      gpu_temp = true;
      gpu_core_clock = true;
      gpu_list = [0];

      cpu_stats = true;
      cpu_temp = true;
      cpu_mhz = true;

      fps = true;
      frametime = true;

      throttling_status = true;

      histogram = true;
    };
  };
}
