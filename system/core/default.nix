{
  lib,
  self,
  ...
}:
# default configuration shared by all hosts
{
  imports = [
    ./users.nix
    ../nix
    ../programs/fish.nix
    ./systemd.nix
  ];

  documentation.dev.enable = true;

  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "ja_JP.UTF-8/UTF-8"
    ];
  };

  system.configurationRevision = self.rev or self.dirtyRev or null;

  # dont touch
  system.stateVersion = lib.mkDefault "23.11";

  time.timeZone = lib.mkDefault "America/Los_Angeles";
}
