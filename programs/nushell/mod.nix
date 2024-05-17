{ config, pkgs, catppuccin, ... }:

{
  programs.nushell = {
    enable = true;
    configFile.source = ./configuration/config.nu;
    envFile.source = ./configuration/env.nu;
    shellAliases = {
      a = "doas";
      b = "bat";
      c = "clear";
      e = "nvim";
      g = "git";
      l = "lsd -l";
      s = "lsd -la";
    };
  };
  programs.carapace.enable = true;
}
