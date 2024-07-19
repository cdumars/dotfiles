{inputs,pkgs,...}: {
  home.programs = [
    inputs.nyaa.packages.${pkgs.system}.default
  ];
}
