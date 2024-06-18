let
  desktop = [
    ./core/boot.nix
    ./core/default.nix
    ./core/security.nix

    ./hardware/opengl.nix
    ./hardware/bluetooth.nix
    ./hardware/udev.nix

    ./network/default.nix

    ./nix

    ./programs
    ./programs/koboldcpp.nix

    ./languages/rust.nix

    ./services
    ./services/pipewire.nix
    ./services/greetd.nix
    ./services/openvpn.nix
    ./services/jellyfin.nix
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
