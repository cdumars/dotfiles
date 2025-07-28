{
  inputs,
  pkgs,
  ...
}: {
  imports = [./configs/terminal.nix];

  programs.mpv = {
    enable = true;

    config = {
      # seeking
      save-position-on-quit = true;
      force-seekable = true;

      # RAM
      cache = true;
      demuxer-max-back-bytes = "20M";
      demuxer-max-bytes = "20M";

      # VIDEO
      alang = "ja,jpn,en,eng";
      slang = "en,eng";
      vo = "gpu-next";

      # AUDIO
      volume-max = 100;
      volume = 100;

      # GENERAL
      keep-open = true;
      hls-bitrate = "max";
      pause = true;
      prefetch-playlist = true;

      hwdec = "auto-safe";

      linear-downscaling = false;
      glsl-shaders-append = [
        "~~/shaders/FSRCNNX_x2_16-0-4-1.glsl"

        "~~/shaders/SSimDownscaler.glsl" # https://gist.github.com/igv/36508af3ffc84410fe39761d6969be10

        "~~/shaders/SSimSuperRes.glsl" # https://gist.github.com/igv/2364ffa6e81540f29cb7ab4c9bc05b6b

        "~~/shaders/KrigBilateral.glsl" # https://gist.github.com/igv/a015fc885d5c22e6891820ad89555637
      ];
    };

    scripts = with pkgs.mpvScripts; [
      autoload
      webtorrent-mpv-hook
      mpv-webm
    ];
    #++ [
    #  pkgs.custom.webtorrent-mpv-hook
    #];
    #++ [inputs.keroro.packages.${pkgs.system}.mpvScripts.default];
  };

  home.file.".config/mpv/shaders" = {
    enable = true;
    recursive = true;
    source = ./shaders;
  };
}
