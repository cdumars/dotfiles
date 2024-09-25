{
  inputs,
  pkgs,
  config,
  ...
}: let
  helix-live-grep = pkgs.writeShellScriptBin "helix-live-grep" ''
    #!${pkgs.bash}/bin/bash

    # live-grep: interactive search, output is "file:line" pairs
    FILE_PATHS=$(live-grep --exit-on-execution | tr '\n' ' ' | sed 's/ *$//')

    # Get ID of the pane above in wezterm, which should be Helix
    HELIX_PANE_ID=$(wezterm cli get-pane-direction Up)

    if [[ -n "$FILE_PATHS" ]]; then
      # Send ":" to start command input in Helix
      wezterm cli send-text --pane-id "$HELIX_PANE_ID" --no-paste ":"

      # Send the "open" command with the file path(s) to the pane
      wezterm cli send-text --pane-id "$HELIX_PANE_ID" "open $FILE_PATHS"

      # Simulate 'Enter' key to execute the command
      printf "\r" | wezterm cli send-text --pane-id "$HELIX_PANE_ID" --no-paste
    fi
  '';
in {
  imports = [
    ./languages.nix
  ];

  programs.helix = {
    enable = true;
    package = inputs.helix.packages.${pkgs.system}.default.overrideAttrs (old: {
      makeWrapperArgs = with pkgs;
        old.makeWrapperArgs
        or []
        ++ [
          "--suffix"
          "PATH"
          ":"
          (lib.makeBinPath [
            clang-tools
            marksman
            nil
            nodePackages.bash-language-server
            vscode-langservers-extracted
            shellcheck
            helix-live-grep
          ])
        ];
    });

    settings = {
#      theme =
#        "catppuccin_"
#        + (
#          if config.theme.name == "light"
#          then "latte"
#          else "mocha"
#        );
      editor = {
        color-modes = true;
        cursorline = true;
        bufferline = "multiple";
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        indent-guides.render = true;
        lsp.display-inlay-hints = true;
        statusline.center = ["position-percentage"];
        true-color = true;
        whitespace.characters = {
          newline = "↴";
          tab = "⇥";
        };
      };

      keys.normal.space.u = {
        f = ":format"; # format using LSP formatter
        w = ":set whitespace.render all";
        W = ":set whitespace.render none";
        g = ":pipe-to wezterm cli split-pane -- helix-live-grep";
      };
    };
  };

#  xdg.configFile."helix/themes" = {
#    enable = true;
#    recursive = true;
#    source = ./themes;
#  };
}
