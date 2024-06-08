{self, ...}: {
  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "ffmpeg-3.4.8"
      ];
    };
  };
}
