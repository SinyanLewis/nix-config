{ config, pkgs, ... }:

{
  home.username = "lewis";
  home.homeDirectory = "/home/lewis";

  home.packages = with pkgs; [
    fastfetch
    fuzzel
    just
    nautilus
    nixd
    nixfmt
    unzip
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
        Remove = [ "Wikipedia (en)" "DuckDuckGo" "Perplexity" ];
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

  programs.vscode = {
    enable = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        ms-ceintl.vscode-language-pack-zh-hans
        ms-vscode.cpptools
        ms-vscode.cmake-tools
        ms-vscode.cpptools-extension-pack
        ms-vscode.hexeditor
        github.vscode-pull-request-github
        jnoortheen.nix-ide
      ];

      userSettings = {
        "editor.fontSize" = 16;
        "editor.fontFamily" = "'JetBrainsMono Nerd Font', monospace";
        "editor.fontLigatures" = true;
        "editor.wordWrap" = "wordWrapColumn";
        "editor.wordWrapColumn" = 80;
        "editor.tabSize" = 2;
        "editor.insertSpaces" = true;
        "editor.formatOnPaste" = true;
        "editor.autoIndentOnPaste" = true;
        "editor.renderWhitespace" = "trailing";
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.guides.bracketPairs" = true;
        "files.insertFinalNewline" = true;
        "files.simpleDialog.enable" = true;
        "files.trimFinalNewlines" = true;
        "files.trimTrailingWhitespace" = true;
        "github.copilot.nextEditSuggestions.enabled" = false;
        "chat.titleBar.openInAgentsWindow.enabled" = false;
        "update.mode" = "none";

        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";

        "nix.serverSettings" = {
          nixd = {
            formatting = {
              command = [ "nixfmt" ];
            };

            nixpkgs = {
              expr = "import (builtins.getFlake (builtins.toString ./.)).inputs.nixpkgs { }";
            };

            options = {
              nixos = {
                expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.nixos-x.options";
              };

              home-manager = {
                expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.nixos-x.options.home-manager.users.type.getSubOptions []";
              };
            };
          };
        };
      };
    };
  };

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

  xdg.configFile."niri".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/config/niri";

  home.stateVersion = "26.05";
}
