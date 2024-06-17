{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (koboldcpp.override {
      march = "x86_64";
      mtune = "znver2";
    })
  ];
}
