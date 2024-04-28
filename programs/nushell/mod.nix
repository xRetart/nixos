{ config, pkgs, catppuccin, ... }:

{
  programs.nushell = {
    enable = true;
    configFile.source = ./configuration/config.nu;
    shellAliases = {
      a = "sudo";
      b = "bat";
      e = "nvim";
      g = "git";
      l = "lsd -l";
      s = "lsd -la";
    };
  };
  programs.carapace.enable = true;
  programs.starship = {
    enable = true;
    catppuccin.enable = true;
  };
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
