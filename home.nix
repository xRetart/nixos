{ config, pkgs, ... }:

{
  imports = [
    ./programs/neovim/mod.nix
	./programs/hyprland.nix
	./programs/nushell/mod.nix
  ];

  home.username = "richard";
  home.homeDirectory = "/home/richard";

  nixpkgs.config.allowUnfree = true;
  xdg.enable = true;

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    keepassxc
    gcc
    neofetch
    nil
    lua-language-server
    brightnessctl
    pavucontrol
    tor-browser
    socat
    plocate

    # unfree
    obsidian
    spotify
    whatsapp-for-linux
    steam-run
  ];

  programs.btop = {
    enable = true;
    catppuccin.enable = true;
  };
  programs.mpv = {
    enable = true;
    catppuccin.enable = true;
  };
  programs.bat = {
    enable = true;
    catppuccin.enable = true;
  };
  programs.lsd.enable = true;
  programs.firefox.enable = true;
  programs.kitty = {
    enable = true;
    settings = {
     enable_audio_bell = false;
     confirm_os_window_close = 0;
    };
    catppuccin.enable = true;
  };
  programs.git.enable = true;
  services.gammastep = {
    enable = true;
    provider = "geoclue2";
    temperature = {
      day = 5000;
      night = 3500;
    };
  };

  catppuccin.flavour = "macchiato";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
