{pkgs, ...}: {
  nixpkgs.overlays = [
    (final: prev: {
      custom = {
        gtk-theme-catppuccin = pkgs.callPackage ./gtk-theme-catppuccin.nix {inherit pkgs;};
      };
    })
  ];
}
