{
  ...
}:
{
  programs.qylock = {
    enable = true;
    theme = "clockwork/orbital";
    sddm.enable = true;
    quickshell.enable = true;
    themeOptions = {
      clockwork.orbital = {
        themeMode = "dark";
        enableWindup = false;
      };
    };
  };
}
