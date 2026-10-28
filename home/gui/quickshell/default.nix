{
  config,
  pkgs,
  inputs,
  ...
}:
{
  programs.quickshell = {
    enable = true;
    systemd.enable = true;
    package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };

  xdg.configFile."quickshell".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/home/gui/quickshell/config";
}
