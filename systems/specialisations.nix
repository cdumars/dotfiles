{
  lib,
  config,
  ...
}: {
  theme = {
    wallpaper = let
      url = "https://9to5mac.com/wp-content/uploads/sites/6/2022/06/macOS-Graphic-Dark.jpg";
      sha256 = "2bd31217f596ba4ddca676396eda49610acdd6f424867043dc491db8a270f3ae";
      ext = lib.last (lib.splitString "." url);
    in
      builtins.fetchurl {
        name = "wallpaper-${sha256}.${ext}";
        inherit url sha256;
      };
  };
}
