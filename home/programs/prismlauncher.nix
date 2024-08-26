{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    (inputs.prism-launcher.packages.${pkgs.system}.default.overrideAttrs (old: {
      makeWrapperArgs = with pkgs;
        old.makeWrapperArgs
        or []
        ++ [
          "--suffix"
          "PATH"
          ":"
          (
            lib.makeBinPath [
              alsa-oss
              openjdk21
              openjdk17
              openjdk8
            ]
          )
        ];
    }))
  ];
}
