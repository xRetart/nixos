{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraLuaPackages = luaPkgs: with luaPkgs; [ jsregexp ];
    extraPackages = with pkgs; [
      nil
      lua-language-server
      ripgrep
      fd
    ];
  };

  xdg.configFile."nvim" = {
    source = ./configuration;
    recursive = true;
  };
}
