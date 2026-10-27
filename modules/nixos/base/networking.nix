{
  ...
}:
{
  networking.hostName = "nixos-x"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;
}
