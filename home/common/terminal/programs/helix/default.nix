{ pkgs, config, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    languages = {
      language = [{
        name = "nix";
      }];
    };
    
    settings = {
      theme = "catppuccin-mocha";
      keys.normal = {
        space.space  = "file_picker";
      };
    };
  };
}
