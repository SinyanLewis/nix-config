{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    fuzzel
    localsend
    swaybg
  ];
}
