{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    fuzzel
    nautilus
    swaybg
  ];
}
