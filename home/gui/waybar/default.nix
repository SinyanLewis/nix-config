{
  config,
  ...
}:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  xdg.configFile."waybar".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/home/gui/waybar/config";
}
