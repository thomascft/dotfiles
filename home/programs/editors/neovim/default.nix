{
  config,
  lib,
  pkgs,
  ...
}: {
  xdg.configFile.nvim = {
    source = ./conf;
    recursive = true;
  };
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      gcc # Needed for Treesitter
      ripgrep # Telescope live_grep
    ];
  };
}
