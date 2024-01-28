{pkgs, ...}: {
  users.users.cooper = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "input"
      "libvirtd"
      "networkmanager"
      "video"
      "wheel"
      "users"
    ];
  };
}
