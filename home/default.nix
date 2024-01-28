{
  lib,
  self,
  inputs,
  ...
}: {
  imports = [
    ./specialisations.nix
    ./terminal
    self.nixosModules.theme
    inputs.matugen.nixosModules.default
  ];

  home = {
    username = "cooper";
    homeDirectory = "/home/cooper";
    stateVersion = "23.11";
  };

  programs.home-manager.enable = true;
}
