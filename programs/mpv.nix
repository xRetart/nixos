{ config, pkgs, catppuccin, ... }:

{
  programs.mpv = {
    enable = true;
    catppuccin.enable = true;
  };
}
