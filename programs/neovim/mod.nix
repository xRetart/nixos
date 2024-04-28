{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    nil
    lua-language-server
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  xdg.configFile."nvim" = {
    source = ./configuration;
    recursive = true;
  };
}
