{ pkgs, ... }:

{
  programs.chromium = {
    package = pkgs.ungoogled-chromium;
    enable = true;
    commandLineArgs = [ "--ozone-platform-hint=auto" ];
  };
}
