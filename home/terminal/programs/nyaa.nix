{inputs, ...}: {
  imports = [
    inputs.nyaa.homeManagerModule
  ];

  programs.nyaa = {
    enable = true;
    download_client = "RunCommand";
    client = {
      cmd = {
        cmd = "mpv '{magnet}'";
        shell_cmd = "sh -c";
      };
      default_app = {
        use_magnet = true;
      };
    };
    clipboard = {
      osc52 = true;
    };
  };
}
