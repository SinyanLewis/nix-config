{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    fuzzel
    localsend
    nautilus
    swaybg
  ];
}
