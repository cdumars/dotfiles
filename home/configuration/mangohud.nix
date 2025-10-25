{
  catppuccin.mangohud.enable = true;

  programs.mangohud = let
    catppuccin-conf = {
      legacy_layout = false;
      round_corners = 10;
      background_alpha = 0.8;
      background_color = "1E1E2E";
      table_columns = 3;

      font_size = 24;
      text_color = "CDD6F4";
      text_outline_color = "313244";

      gpu_text = "GPU";
      gpu_color = "A6E3A1";
      gpu_load_color = ["CDD6F4" "FAB387" "F38BA8"];

      cpu_color = "89B4FA";
      cpu_load_color = ["CDD6F4" "FAB387" "F38BA8"];

      ram_color = "F5C2E7";

      fps_color_change = ["F38BA8" "F8E2AF" "A6E3A1"];

      frametime_color = "A6E3A1";
    };
  in {
    enable = true;

    settings =
      {
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
      }
      // catppuccin-conf;
  };
}
