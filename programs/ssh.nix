{ config, pkgs, catppuccin, ... }:

{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "${homeDirectory}/.ssh/id_ed25519_pri";
      };
      "github.com-work" = {
        hostname = "github.com";
        user = "git";
        identityFile = "${homeDirectory}/.ssh/id_ed25519_pro";
      };
    };
  };
  services.ssh-agent.enable = true;
}
