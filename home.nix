{ config, pkgs, ... }:

{
  imports = [
    ./programs/neovim/mod.nix
	./programs/hyprland.nix
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
    rofi-wayland
    brightnessctl
    pavucontrol
    tor-browser
    socat
    plocate
	swww

    # unfree
    obsidian
    spotify
    whatsapp-for-linux
    steam-run

    # custom
    (writeScriptBin "swww-diashow" (builtins.readFile ./scripts/swww-diashow))
  ];
  programs.carapace.enable = true;

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
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    mouse = true;
    prefix = "C-Space";
    escapeTime = 0;
    catppuccin.enable = true;
  };
  programs.nushell = {
    enable = true;
    configFile.source = ./configuration/nushell/config.nu;
    shellAliases = {
      a = "sudo";
      b = "bat";
      e = "nvim";
      g = "git";
      l = "lsd -l";
      s = "lsd -la";
    };
  };
  programs.starship = {
    enable = true;
    catppuccin.enable = true;
  };
  programs.eww = {
    enable = true;
    configDir = ./configuration/eww;
  };
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
