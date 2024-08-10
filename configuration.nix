# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports = [ ./hardware-configuration.nix ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 3;
        consoleMode = "max";
        editor = false;
        memtest86.enable = true;
      };
      timeout = 0;
      efi.canTouchEfiVariables = true;
    };
  };

  # powers up the default Bluetooth controller on boot
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  hardware.cpu.amd.updateMicrocode = true;
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
  # services.kmscon = {
  #   enable = true;
    # hwRender = true;
    # fonts = [{ name = "MesloLGS NF Regular"; package = pkgs.meslo-lgs-nf; }];
    # extraConfig = ''
    #   font-size=19
    #   xkb-layout=us
    #   xkb-variant=colemak
    # '';
  # };
  security.polkit.enable = true;

  security = {
    sudo.enable = false;
    doas.enable = true;
  };

  networking.hostName = "richard-laptop-nixos";

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
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 4d --keep 3";
    };
    flake = "${config.users.users.richard.home}/nixos";
  };

  services.printing.enable = true;

  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
  };

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # fingerprint
  services.fprintd.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.richard = {
    isNormalUser = true;
    description = "Richard H";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.nushell;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    usbutils
    refind
    efibootmgr
    cifs-utils
    (pkgs.writeScriptBin "sudo" ''exec doas "$@"'')
  ];
  fonts.packages = with pkgs; [ meslo-lgs-nf ];

  boot.supportedFilesystems = [ "cifs" ];
  systemd.mounts = [{
    description = "Leannas cifs share";
    what = "//10.1.0.11/Transfer";
    where = "/home/richard/leannas";
    type = "cifs";
    options = "credentials=/home/richard/nixos/leannas.credentials,rw,uid=1000,gid=1000";
    wantedBy = [ "multi-user.target" ];
  }];

  system.stateVersion = "23.11";
}
