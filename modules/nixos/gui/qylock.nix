{
  ...
}:
{
  programs.qylock = {
    enable = true;
    theme = "clockwork/orbital";
    sddm.enable = true;
    quickshell.enable = false;
    themeOptions = {
      clockwork.orbital = {
        themeMode = "dark";
        enableWindup = false;
      };
    };
  };
}
