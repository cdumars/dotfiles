{pkgs, ...}: {
  home.packages = let
    live-grep = pkgs.writeShellScriptBin "live-grep" ''
      #!${pkgs.bash}/bin/bash
      # Colors
      CATPPUCCIN_GREEN='#a6da95'
      CATPPUCCIN_MAUVE='#c6a0f6'

      # Key bindings
      COPY_FILE_PATH='ctrl-y:execute(echo -n {1}:{2} | wl-copy)'
      KEYS="$COPY_FILE_PATH"

      # Optional flag for execution and exit behavior
      if [[ $1 == '--exit-on-execution' ]]; then
        KEYS="$KEYS+abort"
        shift # remove the flag from the arguments so it's not passed to the `rg` command
      fi

      IFS=$'\n' readarray -t selected_matches < <(
        rg --color=always --line-number --no-heading --smart-case "''${*:-}" |
          fzf --ansi \
            --border \
            --color "hl+:$CATPPUCCIN_GREEN:reverse,hl:$CATPPUCCIN_MAUVE:reverse" \
            --delimiter ':' \
            --height '100%' \
            --multi \
            --print-query --exit-0 \
            --preview 'bat {1} --highlight-line {2}' \
            --preview-window 'right,+{2}+3/3,~3' \
            --scrollbar '▍' \
            --bind "$KEYS"
      )

      # Print the file path and line number of each match
      for line in "''${selected_matches[@]:1}"; do
        file=$(echo "$line" | cut -d: -f1)
        line_number=$(echo "$line" | cut -d: -f2)
        echo "$file:$line_number"
      done
    '';
  in [
    live-grep
  ];
}
