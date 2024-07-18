let
  desktop = [
    ./core/boot.nix
    ./core/default.nix
    ./core/security

    ./hardware/opengl.nix
    ./hardware/bluetooth.nix
    ./hardware/udev.nix

    ./network/default.nix

    ./nix

    ./programs

    ./services
    ./services/pipewire.nix
    ./services/gvfs.nix
  ];

  server = [
    ./nix
  ];

  laptop = [
    ./nix
    ./darwin/programs/home-manager.nix
    ./darwin/programs/fonts.nix
    ./darwin/nix.nix
    ./languages/rust.nix
    ./programs/fish.nix
  ];
in {
  inherit desktop server laptop;
}
