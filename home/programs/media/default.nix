{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./mpv
  ];

  # image viewer
  programs.imv = {
    enable = true;
    settings = {
      #catppuccin-mocha background color
      options.background = lib.mkForce "1E1E2E";
    };
  };

  home.packages = with pkgs; [
    # audio control
    pavucontrol
    pulsemixer

    # images
    hydrus
    # (hydrus.overrideAttrs {
    #   version = "578";
    #   src = fetchFromGitHub {
    #     owner = "hydrusnetwork";
    #     repo = "hydrus";
    #     rev = "refs/tags/v578";
    #     hash = "sha256-u2SXhL57iNVjRFqerzc/TByB9ArAJx81mxOjTBVBMkg=";
    #   };
    # })
  ];
}
