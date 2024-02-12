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
in {
  inherit desktop;
}
