{pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    (kicad.overrideAttrs (old: {
      buildInputs = old.buildInputs or []
      ++ [
        pkgs.makeWrapper
      ];
    
      postFixup = ''
        makeWrapper $out/bin/kicad --set GTK_THEME Adwaita
      '';
    }))
  ];
}
