{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    extraConfig = {
      commit.gpgsign = true;
      safe.directory = "*";
    };
    delta.enable = true;
    aliases = {
      a = "add -A";
      c = "commit -m";
      d = "diff";
      l = "log";
      p = "push";
      r = "revert";
      s = "status";
      ac = "!git a -A && git c";
    };
  };
}
