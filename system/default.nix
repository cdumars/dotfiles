let
  desktop = [
    ./core/boot.nix
    ./core/default.nix
    ./core/security.nix

    ./hardware/opengl.nix
    ./hardware/bluetooth.nix

    ./network/default.nix

    ./programs

    ./languages/rust.nix

    ./services
    ./services/pipewire.nix
    ./services/greetd.nix
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
  inherit desktop laptop;
}
