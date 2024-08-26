{
  services.nixos-cli = {
    enable = true;
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
