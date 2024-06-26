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
    p7zip

    # misc
    libnotify
    fastfetch

    inputs.nyaa.packages.${pkgs.system}.default
    inputs.keroro.packages.${pkgs.system}.default

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
