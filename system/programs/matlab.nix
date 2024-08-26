{ inputs, pkgs, ...}: {
  environment.systemPackages = [
    inputs.nix-matlab.packages.${pkgs.system}.matlab
  ];
}
