{self, ...}: {
  imports = [
    "${self}/pkgs"
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
}
