{pkgs, ...}: let
  irony-unwrapped = pkgs.stdenv.mkDerivation rec {
    pname = "IronyModManager";
    version = "1.26.259";

    src = builtins.fetchurl {
      url = "https://github.com/bcssov/IronyModManager/releases/download/v${version}/linux-x64.zip";
      sha256 = "sha256:1qdvhhxwfr4c62wf0dh9q9zjhjz0ccdwqj7yd1rbvdgigxn12190";
    };

    nativeBuildInputs = [
      pkgs.autoPatchelfHook
      pkgs.unzip
    ];

    buildInputs = with pkgs; [
      glibc
      gcc-unwrapped
      fontconfig
      lttng-ust_2_12
    ];

    unpackPhase = "true";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/opt/IronyModManager
      unzip -d $out/opt/IronyModManager $src
      mkdir $out/bin
      ln -s $out/opt/IronyModManager/IronyModManager $out/bin/IronyModManager
      chmod 755 $out/bin/IronyModManager
      runHook postInstall
    '';
  };
in
  pkgs.buildFHSEnv {
    name = "IronyModManager";
    targetPkgs = pkgs: [irony-unwrapped];
    multiPkgs = pkgs: [
      pkgs.icu
      pkgs.openssl
      pkgs.libx11
      pkgs.xorg.libICE
      pkgs.xorg.libSM
    ];
    runScript = ''IronyModManager'';
  }
