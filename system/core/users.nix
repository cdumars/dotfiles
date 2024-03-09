{pkgs, ...}: {
  users.users.cooper = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups =
      if pkgs.system == "x86_64-linux"
      then [
        "input"
        "libvirtd"
        "networkmanager"
        "video"
        "wheel"
        "users"
      ]
      else null;
  };
}
