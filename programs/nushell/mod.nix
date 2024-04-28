{ config, pkgs, catppuccin, ... }:

{
  imports = [
    ./tmux.nix
    ./starship.nix
  ];
  programs.nushell = {
    enable = true;
    configFile.source = ./configuration/config.nu;
    shellAliases = {
      a = "sudo";
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
