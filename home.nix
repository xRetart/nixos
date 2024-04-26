{ config, pkgs, ... }:

{
  home.username = "richard";
  home.homeDirectory = "/home/richard";

  nixpkgs.config = {
    allowUnfree = true;
  };
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
    hyprpaper
    pavucontrol
    hyprcursor
    tor-browser
    socat
    plocate

    # unfree
    obsidian
    spotify
    whatsapp-for-linux
    steam-run
  ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
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

  wayland.windowManager.hyprland.settings = {
    monitor = ",preferred,auto,auto";
    "$mainMod" = "SUPER";

    exec-once = "eww open bar & hyprpaper & firefox";

    env = [
      "XCURSOR_SIZE,32"
      "QT_QPA_PLATFORMTHEME,qt5ct"
    ];

    input = {
      kb_layout = "us";
      kb_variant = "colemak";
      kb_model = "";
      kb_options = "";
      kb_rules = "";

      follow_mouse = "1";

      touchpad = {
        "natural_scroll" = "1";
      };
    };

    general = {
      gaps_in = "5";
      gaps_out = "20";
      border_size = "2";
      col.active_border = "rgba(33ccffee) rgba(00ff99ee) 45deg";
      col.inactive_border = "rgba(595959aa)";

      layout = "dwindle";

      allow_tearing = false;
    };
    decoration = {
      rounding = "10";

      blur = {
        enabled = "true";
        size = "3";
        passes = "1";
      };

      drop_shadow = "yes";
      shadow_range = "4";
      shadow_render_power = "3";
      col.shadow = "rgba(1a1a1aee)";
    };

    animations = {                                                                                                                       
      enabled = "yes";
                                                                                                                                     
      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

      animation = [
        "windows, 1, 7, myBezier"
        "windowsOut, 1, 7, default, popin 80%"
        "border, 1, 10, default"
        "borderangle, 1, 8, default"
        "fade, 1, 7, default"
        "workspaces, 1, 6, default"
      ];
    };

    dwindle = {
      pseudotile = "yes";
      preserve_split = "yes";
    };

    master = {
      new_is_master = "trueon";
    };

    gestures = {
      workspace_swipe = "true";
      workspace_swipe_distance = "200";
      workspace_swipe_invert = "false";
    };

    misc = {
      force_default_wallpaper = "-1";
    };

    device = {
      name = "epic-mouse-v1";
      sensitivity = "-0.5";
    };

    windowrulev2 = "suppressevent maximize, class:.*";
  
    bindm = [
      # mouse movements
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
    bind = [
      # apps
      "$mainMod, P, exec, $menu"
      "$mainMod CONTROL, Return, exec, $terminal"
      "$mainMod CONTROL, F, exec, $browser"
      "$mainMod CONTROL, M, exec, $fileManager"

      # navigation
      "$mainMod, i, movefocus, l"
      "$mainMod, o, movefocus, r"
      "$mainMod, e, movefocus, u"
      "$mainMod, n, movefocus, d"

      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"
      "$mainMod, K, workspace, empty"
      "$mainMod, R, togglespecialworkspace, magic"

      "$mainMod, T, workspace, e+1"
      "$mainMod, S, workspace, e-1"

      # modification
      "$mainMod SHIFT, C, killactive,"
      "$mainMod SHIFT, F, togglefloating,"
      "$mainMod SHIFT, S, togglesplit,"
      "$mainMod SHIFT, P, pseudo,"

      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"
      "$mainMod SHIFT, S, movetoworkspace, special:magic"
      "$mainMod SHIFT, K, movetoworkspace, empty"

      # meta
      "$mainMod CONTROL SHIFT, Q, exit,"

      # f keys
      ", XF86MonBrightnessDown, exec, $brightnessDown"
      ", XF86MonBrightnessUp, exec, $brightnessUp"
    ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
