{pkgs, ...}: {
  nixpkgs.overlays = [
    (final: prev: {
      custom = {
        gtk-theme-catppuccin = pkgs.callPackage ./gtk-theme-catppuccin.nix {inherit pkgs;};
        webtorrent-mpv-hook = pkgs.callPackage ./webtorrent-mpv-hook.nix {
          lib = pkgs.lib;
          buildNpmPackage = pkgs.buildNpmPackage;
          fetchFromGitHub = pkgs.fetchFromGitHub;
          gitUpdater = pkgs.gitUpdater;
          nodejs = pkgs.nodejs;
          cmake = pkgs.cmake;
          pkg-config = pkgs.pkg-config;
          openssl = pkgs.openssl;
          libdatachannel = pkgs.libdatachannel;
          plog = pkgs.plog;
        };
      };
    })
  ];
}
