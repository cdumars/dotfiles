{ inputs, pkgs, ...}: {
  environment.systemPackages = [
    inputs.nix-matlab.packages.${pkgs.version}.matlab
  ];
}
