{ config, pkgs, ... }:

{
  imports = [
    ./programs/neovim/mod.nix
    ./programs/hyprland.nix
    ./programs/tmux.nix
    ./programs/starship.nix
    ./programs/nushell/mod.nix
    ./programs/kitty.nix
    ./programs/gammastep.nix
  ];

  home.username = "richard";
  home.homeDirectory = "/home/richard";

  nixpkgs.config.allowUnfree = true;
  xdg.enable = true;

  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    keepassxc
    neofetch
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
  # systemd.user.mounts = {
  #   home-richard-leannas = {
  #     Unit = {
  #       Description = "Leannas cifs share mounted at boot";
  #     };
  #     Mount = {
  #       What = "//10.1.0.11/Transfer";
  #       Where = /home/richard/leannas;
  #       Options = [ "credentials=/etc/nixos/leannas.credentials" "uid=1000" "gid=1000" "" ];
  #       Type = "cifs";
  #       TimeoutSec = 10;
  #     };
  #     Install = {
  #       WantedBy = [ "multi-user.target" ];
  #     };
  #   };
  # };

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
  programs.git.enable = true;

  catppuccin.flavour = "macchiato";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
