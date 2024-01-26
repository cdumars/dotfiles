{ pkgs, ... }:

{
  programs.carapace = {
    enable = true;
    # default integration uses a depricated feature
#    enableNushellIntegration = true;
  };
}
