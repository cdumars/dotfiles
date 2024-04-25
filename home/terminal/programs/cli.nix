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

    inputs.nyaa.packages.${pkgs.system}.default
    inputs.keroro.packages.${pkgs.system}.default

    # utils
    du-dust
    duf
    ncdu
    fd
    file
    jaq
    ripgrep
    tldr
    tree
    jq
    wget
    yt-dlp
  ];

  programs = {
    eza.enable = true;
    ssh.enable = true;
  };
}
