{ config, pkgs, catppuccin, ... }:

{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    mouse = true;
    prefix = "C-Space";
    escapeTime = 0;
    catppuccin.enable = true;
  };
}
