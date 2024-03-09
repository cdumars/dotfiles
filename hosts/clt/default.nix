{
  self,
  lib,
  ...
}: {
  system.configurationRevision = self.rev or self.dirtyRev or null;

  system.stateVersion = 4;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-darwin";
}
