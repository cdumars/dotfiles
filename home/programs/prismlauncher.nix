{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    inputs.prism-launcher.packages.${pkgs.system}.default
    pkgs.alsa-oss
    pkgs.openjdk21
  ];
}
