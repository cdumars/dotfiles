{
  systems = ["x86_64-linux" "x86_64-darwin"];

  perSystem = {
    pkgs,
    inputs',
    ...
  }: {
    packages = {
      keroro = pkgs.callPackage ./keroro {};
    };
  };
}
