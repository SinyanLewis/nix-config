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
        # KISS Translator
        "{fb25c100-22ce-4d5a-be7e-75f3d6f0fc13}" = {
          installation_mode = "force_installed";
          private_browsing = true;
          default_area = "menupanel";
        };
        # Bitwarden
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
