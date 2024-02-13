{ inputs, pkgs, ... }: {
  home.packages = [
    inputs.prism-launcher.packages.${pkgs.system}.default
  ];
}
