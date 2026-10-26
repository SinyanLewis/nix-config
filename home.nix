{
  config,
  pkgs,
  inputs,
  ...
}:
{
  home.username = "lewis";
  home.homeDirectory = "/home/lewis";

  home.packages = with pkgs; [
    curl
    fastfetch
    fd
    fzf
    fuzzel
    just
    lazygit
    nautilus
    nixd
    nixfmt
    ripgrep
    swaybg
    tree-sitter
    unzip

    inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.pi
  ];

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  home.pointerCursor = {
    enable = true;
    package = pkgs.capitaine-cursors;
    name = "capitaine-cursors";
    size = 28;

    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;
    cursorTheme = {
      name = "capitaine-cursors";
      package = pkgs.capitaine-cursors;
      size = 28;
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
    sideloadInitLua = true;
  };

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

  programs.vscode.enable = true;

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

  programs.kitty = {
    enable = true;
    font.name = "Jetbrains Mono NF";
    font.size = 14;
    shellIntegration.enableFishIntegration = true;
    settings.shell = "fish";
  };

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = "set fish_greeting";
  };

  xdg.dataFile."fcitx5/rime/default.custom.yaml".text = ''
    patch:
      __include: rime_ice_suggestion:/
  '';

  xdg.configFile."niri".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/config/niri";

  xdg.configFile."waybar".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/config/waybar";

  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/config/nvim";

  home.stateVersion = "26.05";
}
