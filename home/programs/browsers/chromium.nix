{ pkgs, ... }:

{
  programs.chromium = {
    package = pkgs.ungoogled-chromium;
    enable = true;
    commandLineArgs = [ "--ozone-platform-hint=auto" ];
  };

  programs.librewolf = {
    enable = true;
  };
}
