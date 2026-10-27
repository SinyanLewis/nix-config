{
  pkgs,
  inputs,
  ...
}:
{
  home.packages = with pkgs; [
    curl
    fastfetch
    fd
    fzf
    just
    lazygit
    nixd
    nixfmt
    ripgrep
    tree-sitter
    unzip

    inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.pi
  ];
}
