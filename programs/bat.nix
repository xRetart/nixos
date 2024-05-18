{ config, pkgs, catppuccin, ... }:

{
  programs.bat = {
    enable = true;
    catppuccin.enable = true;
  };
}
