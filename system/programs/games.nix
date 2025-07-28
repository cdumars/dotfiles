{
  pkgs,
  lib,
  ...
}: {
  programs.steam = {
    # window doesn't load properly
    enable = true;

    gamescopeSession.enable = true;

    # fix gamescope inside steam
    package = pkgs.steam.override {
      extraPkgs = pkgs:
        with pkgs; [
          pango
          libthai
          harfbuzz
          keyutils
          libkrb5
          libpng
          libpulseaudio
          libvorbis
          pipewire
          mangohud
          stdenv.cc.cc.lib
          xorg.libXcursor
          xorg.libXi
          xorg.libXinerama
          xorg.libXScrnSaver
        ];
    };
  };

  programs.gamescope = {
    enable = true;
    package = pkgs.gamescope.overrideAttrs {
      version = "3.16.2";
    };
  };

  environment.systemPackages = [
    (pkgs.lutris.override {
      extraPkgs = pkgs:
        with pkgs; [
          SDL2
          pango
          libthai
          harfbuzz
          keyutils
          libkrb5
          libpng
          libpulseaudio
          libvorbis
          pipewire
          mangohud
          stdenv.cc.cc.lib
          xorg.libXcursor
          xorg.libXi
          xorg.libXinerama
          xorg.libXScrnSaver
        ];
    })
  ];

  virtualisation.waydroid.enable = true;

  programs.sleepy-launcher.enable = true;
}
