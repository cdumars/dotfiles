{
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = ["445a:2260:8cae1d06"];
        settings = {
          main = {
            capslock = "overload(control, esc)";
            esc = "capslock";
            "j+k" = "esc";
          };
        };
      };
    };
  };
}
