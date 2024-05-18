{ config, pkgs, catppuccin, ... }:

{
  programs.btop = {
    enable = true;
    catppuccin.enable = true;
  };
}
