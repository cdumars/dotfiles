{
  imports = [
    ./mangohud.nix
  ];

  xdg.configFile."nixpkgs/config.nix".source = ./nixpkgs.nix;
}
