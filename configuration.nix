# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports = [ ./hardware-configuration.nix ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # powers up the default Bluetooth controller on boot
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;
  services.locate = {
    enable = true;
    package = pkgs.plocate;
    localuser = null;
  };
  services.geoclue2 = {
    enable = true;
    appConfig.gammastep = {
      isAllowed = true;
      isSystem = true;
      users = [ "1000" ];
    };
  };
  services.kmscon = {
    enable = true;
    hwRender = true;
    fonts = [ { name = "MesloLGS NF Regular"; package = pkgs.meslo-lgs-nf; } ];
    extraConfig = ''
      font-size=18
      xkb-layout=us
      xkb-variant=colemak
    '';
  };
  security.polkit.enable = true;

  security.sudo.enable = false;
  security.doas.enable = true;

  networking.hostName = "richard-laptop-nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  console.useXkbConfig = true;
  i18n = {
    defaultLocale = "en_US.UTF-8";
    # extraLocaleSettings = {
    #   LC_ADDRESS = "de_DE.UTF-8";
    #   LC_IDENTIFICATION = "de_DE.UTF-8";
    #   LC_MEASUREMENT = "de_DE.UTF-8";
    #   LC_MONETARY = "de_DE.UTF-8";
    #   LC_NAME = "de_DE.UTF-8";
    #   LC_NUMERIC = "de_DE.UTF-8";
    #   LC_PAPER = "de_DE.UTF-8";
    #   LC_TELEPHONE = "de_DE.UTF-8";
    #   LC_TIME = "de_DE.UTF-8";
    # };
  };

  # Enable the X11 windowing system.
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
  services.xserver = {
    enable = true;
    desktopManager.plasma5 = {
      enable = true;
      useQtScaling = true;
    };

    xkb = {
      layout = "us";
      variant = "colemak";
    };
  };


  programs.hyprland.enable = true;
  programs.git.enable = true;

  services.printing.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # fingerprint
  services.fprintd = {
    enable = true;
    # package = pkgs.fprintd.overrideAttrs {
    #   mesonCheckFlags = [
    #     "--no-suite"
    #     "fprintd:TestPamFprintd"
    #   ];
    # };
    # tod = {
    #   enable = true;
    #   driver = pkgs.libfprint-2-tod1-goodix;
    # };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.richard = {
    isNormalUser = true;
    description = "Richard H";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.nushell;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (_: true);

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    usbutils
    refind
    efibootmgr
  ];
  fonts.packages = with pkgs; [ meslo-lgs-nf ];

  # fileSystems."/mnt/leannas" = {
  #   device = "//10.1.0.11/Transfer";
  #   fsType = "cifs";
  #   options = let
  #     prevent_hang_options = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s,user,users";
  #     authenticate_option = "credentials=/etc/nixos/leannas.credentials";
  #     permission_options = "uid=1000,gid=1000";
  #
  #   in ["${prevent_hang_options},${authenticate_option},${permission_options}"];
  # };
  boot.supportedFilesystems = [ "cifs" ];
  systemd.mounts = [{
    description = "Leannas cifs share mounted at boot";
    what = "//10.1.0.11/Transfer";
    where = "/home/richard/leannas";
    type = "cifs";
    options = "credentials=/home/richard/nixos/leannas.credentials,rw,uid=1000,gid=1000";
  }];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
