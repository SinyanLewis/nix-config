{
  pkgs,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    vim
    wget
    efibootmgr
    gcc
    gnumake
    gdb
    cmake
    ninja
    clang-tools
  ];
}
