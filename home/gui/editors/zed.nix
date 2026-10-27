{
  pkgs,
  ...
}:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "just"
      "kdl"
      "env"
    ];
    userSettings = { };
    extraPackages = [ pkgs.nixd ];
  };
}
