{pkgs, ...}: {
  imports = [
    ./mpv
  ];

  home.packages = with pkgs; [
    # audio control
    pavucontrol
    pulsemixer

    # images
    imv
    (hydrus.overrideAttrs {
      version = "578";
      src = fetchFromGitHub {
        owner = "hydrusnetwork";
        repo = "hydrus";
        rev = "refs/tags/v578";
        hash = "sha256-u2SXhL57iNVjRFqerzc/TByB9ArAJx81mxOjTBVBMkg=";
      };
    })
  ];
}
