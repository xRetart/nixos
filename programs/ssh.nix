{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    matchBlocks =
	  let
	    privateIdentity = "${config.home.homeDirectory}/.ssh/id_ed25519_pri";
	    publicIdentity = "${config.home.homeDirectory}/.ssh/id_ed25519_pro";
	  in
	  {
        "github.com" = {
          hostname = "github.com";
          user = "git";
          identityFile = privateIdentity;
        };
        "github.com-work" = {
          hostname = "github.com";
          user = "git";
          identityFile = publicIdentity;
        };
        "git.tu-berlin.de" = {
          hostname = "git.tu-berlin.com";
          user = "git";
          identityFile = publicIdentity;
        };
      };
  };
  services.ssh-agent.enable = true;
}
