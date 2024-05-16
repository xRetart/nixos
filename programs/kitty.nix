{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "MesloLGS NF Regular";
      package = pkgs.meslo-lgs-nf;
    };
    settings = {
      enable_audio_bell = false;
      confirm_os_window_close = 0;
    };
    catppuccin.enable = true;
  };
}
