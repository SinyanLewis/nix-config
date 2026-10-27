{
  ...
}:
{
  programs.firefox = {
    enable = true;
    languagePacks = [ "en-US" ];

    policies = {
      BlockAboutConfig = true;

      Homepage = {
        URL = "about:home";
        Locked = true;
        StartPage = "homepage";
      };

      DownloadDirectory = "\${home}/Downloads";

      ExtensionSettings = {
        # uBlock Origin
        "uBlock0@raymondhill.net" = {
          installation_mode = "force_installed";
          private_browsing = true;
          default_area = "menupanel";
        };
        # Tampermonkey
        "firefox@tampermonkey.net" = {
          installation_mode = "force_installed";
          private_browsing = true;
          default_area = "menupanel";
        };
        # Dark Reader
        "addon@darkreader.org" = {
          installation_mode = "force_installed";
          private_browsing = true;
          default_area = "menupanel";
        };
        "{5efceaa7-f3a2-4e59-a54b-85319448e305}" = {
          installation_mode = "force_installed";
          private_browsing = true;
          default_area = "menupanel";
        };
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          installation_mode = "force_installed";
          private_browsing = true;
          default_area = "menupanel";
        };
      };

      SearchEngines = {
        Default = "Bing";
        PreventInstalls = true;
        Remove = [
          "Wikipedia (en)"
          "DuckDuckGo"
          "Perplexity"
        ];
      };

      TranslateEnabled = false;
      ShowHomeButton = true;

      Preferences = {
        "browser.tabs.closeWindowWithLastTab" = {
          Value = false;
          Status = "locked";
        };
      };
    };
  };
}
