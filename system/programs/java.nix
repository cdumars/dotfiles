{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    jre
    jre8
  ];
}
