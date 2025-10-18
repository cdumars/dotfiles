{
  config,
  pkgs,
  ...
}: let
  browser = ["librewolf"];
  imageViewer = ["imv"];
  videoPlayer = ["mpv"];
  audioPlayer = ["mpv"];
  fileCompressor = ["org.gnome.FileRoller"];

  xdgAssociations = type: program: list:
    builtins.listToAttrs (map (e: {
        name = "${type}/${e}";
        value = program;
      })
      list);

  image = xdgAssociations "image" imageViewer ["png" "svg" "jpeg" "git"];
  video = xdgAssociations "video" videoPlayer ["mp4" "avi" "mkv" "webm"];
  audio = xdgAssociations "audio" audioPlayer ["mp3" "flac" "wav" "aac"];
  compressed = xdgAssociations "application" fileCompressor ["zip" "x-7z-compressed" "vnd.rar"];
  browserTypes =
    (xdgAssociations "application" browser [
      "json"
      "x-extension-htm"
      "x-extension-html"
      "x-extension-shtml"
      "x-extension-xht"
      "x-extension-xhtml"
    ])
    // (xdgAssociations "x-scheme-handler" browser [
      "about"
      "ftp"
      "http"
      "https"
      "unknown"
    ]);

  # XDG MIME types
  associations = builtins.mapAttrs (_: v: (map (e: "${e}.desktop") v)) ({
      "applications/pdf" = ["org.pwmt.zathura-pdf-mupdf"];
      "text/html" = browser;
      "text/plain" = ["Helix"];
      "x-scheme-handler/chrome" = ["chromium-browser"];
      "inode/directory" = ["org.gnome.Nautilus"];
    }
    // image
    // video
    // audio
    // compressed
    // browserTypes);
in {
  xdg = {
    enable = true;
    cacheHome = config.home.homeDirectory + "/.local/cache";

    mimeApps = {
      enable = true;
      defaultApplications = associations;
    };

    userDirs = {
      enable = true;
      createDirectories = true;
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
      };
    };
  };

  home.packages = [
    # used by `gio open` and `xdp-gtk`
    (pkgs.writeShellScriptBin "xdg-terminal-exec" ''
      wezterm start "$@"
    '')
    pkgs.xdg-utils
  ];
}
