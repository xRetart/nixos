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
    ./programs/bat.nix
    ./programs/git.nix
    ./programs/gpg.nix
    ./programs/ssh.nix
    ./programs/firefox.nix
    ./programs/btop.nix
    ./programs/lsd.nix
    ./programs/mpv.nix
    ./programs/clipman.nix
    ./programs/lazygit.nix
	./stylix.nix
  ];

  home = {
    username = "richard";
    homeDirectory = "/home/richard";
    stateVersion = "23.11";

    packages = with pkgs; [
      keepassxc
      neofetch
      brightnessctl
      pavucontrol
      tor-browser
      socat
      plocate
      sbctl

      # unfree packages
      obsidian
      spotify
      whatsapp-for-linux
      steam-run
    ];
  };

  nixpkgs.config.allowUnfree = true;

# systemd.user.mounts = {
#   home-richard-leannas = {
#     Unit = {
#       Description = "Leannas cifs share mounted at boot";
#     };
#     Mount = {
  #       What = "//10.1.0.11/Transfer";
  #       Where = "/home/richard/leannas";
  #       Options = [ "credentials=/home/richard/leannas.credentials,rw,users,uid=1000,gid=1000" ];
  #       Type = "cifs";
  #       # TimeoutSec = 10;
  #     };
  #     Install = {
  #       WantedBy = [ "multi-user.target" ];
  #     };
  #   };
  # };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
