{
  pkgs,
  ...
}:
{
  imports = [
    ./browsers.nix
    ./fcitx5.nix
    ./kitty.nix
    ./packages.nix

    ./editors
    ./niri
    ./quickshell
    ./waybar
  ];

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  home.pointerCursor = {
    enable = true;
    package = pkgs.capitaine-cursors;
    name = "capitaine-cursors";
    size = 28;

    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;
    cursorTheme = {
      name = "capitaine-cursors";
      package = pkgs.capitaine-cursors;
      size = 28;
    };
  };
}
