{pkgs, ...}: {
  nixpkgs.overlays = [
    (final: prev: {
      irony-mod-manager = pkgs.callPackage ./irony-mod-manager.nix;
    })
  ];
}
