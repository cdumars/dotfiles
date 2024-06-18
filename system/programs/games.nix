{pkgs, ...}: {
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
          stdenv.cc.cc.lib
          xorg.libXcursor
          xorg.libXi
          xorg.libXinerama
          xorg.libXScrnSaver
        ];
    };
  };

  environment.systemPackages = let
    lutris = pkgs.lutris.override {
      # tentatively fix gamescope?
      extraPkgs = pkgs:
        with pkgs; [
          pango
          libthai
          harfbuzz
          keyutils
          libkrb5
          libpng
          libpulseaudio
          pipewire
          libvorbis
          stdenv.cc.cc.lib
          xorg.libXcursor
          xorg.libXi
          xorg.libXinerama
          xorg.libXScrnSaver
        ];
    };
  in [
    lutris
  ];
}
