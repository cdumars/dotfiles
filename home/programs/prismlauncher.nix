{
  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    (inputs.prism-launcher.packages.${pkgs.system}.default.overrideAttrs (old: {
      makeWrapperArgs =
        old.makeWrapperArgs
        or []
        ++ [
          "--suffix"
          "PATH"
          ":"
          (
            pkgs.lib.makeBinPath [
              pkgs.alsa-oss
              pkgs.openjdk21
              pkgs.openjdk17
              pkgs.openjdk8
              pkgs.openjdk25
            ]
          )
        ];
    }))
  ];
}
