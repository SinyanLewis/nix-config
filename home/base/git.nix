{
  ...
}:
{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Sinyan Lewis";
      user.email = "me@lewxx.com";
      init.defaultBranch = "main";
      #user.signingkey = "161607A14A7E54F9";
      #commit.gpgsign = true;
    };
  };
}
