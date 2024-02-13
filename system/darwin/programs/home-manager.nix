{inputs, ...}: {
  imports = [
    inputs.hm.darwinModules.default
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
