{
  self,
  pkgs,
  ...
}: {
  services.nixos-cli = {
    enable = true;
    package = self.inputs.nixos-cli.packages.${pkgs.system}.default;
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

  environment.systemPackages = with pkgs; [
    nix-output-monitor
  ];
}
