{
  pkgs,
  ...
}:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "just"
      "kdl"
      "env"
      "neocmake"
      "git-firefly"
    ];
    userSettings = {
      auto_update = false;
      use_system_path_prompts = false;
      use_system_prompts = false;
      theme = "Ayu Dark";
      buffer_font_family = "JetBrains Mono NL";
      buffer_font_size = 16;
      ui_font_family = "JetBrains Mono NL";
      ui_font_size = 16;
      cursor_animation.enabled = true;
      current_line_highlight = "line";
      vertical_scroll_margin = 5;
      sticky_scroll.enabled = true;
      auto_signature_help = true;
      minimap.show = "always";
      tab_size = 2;
      indent_guides.coloring = "indent_aware";
      show_whitespaces = "trailing";
      editor.completion_menu_item_kind = "symbol";
      inlay_hints.enabled = true;
      inlay_hints.show_background = true;
      colorize_brackets = true;
      semantic_tokens = "combined";
      status_bar.line_endings_button = true;
      title_bar.show_branch_status_icon = true;
      title_bar.show_sign_in = false;
      title_bar.show_user_menu = false;
      tabs.git_status = true;
      window_decorations = "server";
      project_panel.dock = "left";
      project_panel.hide_root = true;
      project_panel.git_status_indicator = true;
      terminal.show_count_badge = true;
      git_panel.commit_title_max_length = 50;
      agent.dock = "right";
      terminal.cursor_shape = "bar";

      languages.Nix.language_servers = [
        "nixd"
        "!nil"
      ];
    };
    extraPackages = [ pkgs.nixd ];
  };
}
