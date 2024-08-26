{
  self,
  pkgs,
  ...
}: {
  services.nixos-cli = {
    enable = true;
    package = self.inputs.nixos-cli.packages.${pkgs.system}.default.overrideAttrs (old: {
      makeWrapperArgs = with pkgs;
        old.makeWrapperArgs
        or []
        ++ [
          "--suffix"
          "PATH"
          ":"
          (
            lib.makeBinPath [
              nix-output-monitor
            ]
          )
        ];
    });
    config = {
      config_location = "/home/cooper/Documents/dotfiles";
      no_confirm = true;

      aliases = {
        switch = ["generation" "switch"];
        rollback = ["generation" "rollback"];
      };

      apply = {
        use_nom = true;
      };
    };
  };
}
