{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      enable_audio_bell = false;
      confirm_os_window_close = 0;
    };
  };
  xdg.configFile = {
    "kitty/dracula.conf" = {
      source = ./config/kitty/dracula.conf;
    };
    "kitty/diff.conf" = {
      source = ./config/kitty/diff.conf;
    };
  };
}
