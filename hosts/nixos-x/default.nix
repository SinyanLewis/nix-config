{
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./disko.nix
    ./hardware/nvidia.nix

    ../../modules/nixos/base
    ../../modules/nixos/tui
    ../../modules/nixos/gui
  ];

  time.timeZone = "Asia/Shanghai";
  system.stateVersion = "26.05";
}
