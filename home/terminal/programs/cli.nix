{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    unrar
    _7zz

    # misc
    libnotify
    fastfetch

    # utils
    du-dust
    duf
    ncdu
    fd
    file
    fzf
    jaq
    killall
    ripgrep
    tldr
    jq
    wget
    yt-dlp
    trash-cli
  ];

  programs = {
    eza.enable = true;
    ssh.enable = true;
  };
}
