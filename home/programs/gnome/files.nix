{pkgs, ...}: {
  home.packages = with pkgs; [
    (nautilus.overrideAttrs (old: {
      buildInputs =
        old.buildInputs
        ++ (with gst_all_1; [
          gst-plugins-good
          gst-plugins-bad
        ]);
    }))
    ffmpegthumbs
    ffmpegthumbnailer
    file-roller
  ];
}
