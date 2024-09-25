{
  pkgs,
  theme ? ["default"],
  size ? ["standard"],
  color ? ["dark"],
  ...
}:
pkgs.stdenv.mkDerivation rec {
  pname = "gtk-theme-catppuccin";
  version = "0.0.1";

  src = pkgs.fetchFromGitHub {
    owner = "Fausto-Korpsvart";
    repo = "Catppuccin-GTK-Theme";
    rev = "bddedc3e40bd865b7c072bb76084ffdf53a7f727";
    hash = "sha256-tTiB9IeGH1BiYQzSIn69522IvSNLqLjyeeRJ/RDiW+U=";
  };

  nativebuildInputs = [
    pkgs.sassc
    pkgs.gtk3
  ];

  dontConfigure = true;
  dontBuild = true;

  propagatedUserEnvPkgs = [
    pkgs.gtk-engine-murrine
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/themes

    bash $src/themes/install.sh -d $out/share/themes \
      -t ${builtins.toString theme} \
      -c ${builtins.toString color} \
      -s ${builtins.toString size} \

    runHook postInstall
  '';
}
