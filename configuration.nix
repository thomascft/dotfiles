{config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader = {
    systemd-boot.enable = true;
	efi.canTouchEfiVariables = true;

  };

  networking = {
    hostName = "thonkpad"
	networkmanager.enable = true;
  };

  users.users.thomas = {
    isNormalUser = true;
	extraGroups = ["wheel"];
  };

  time.timeZone = "America/Denver";

  services = {
    pipewire = {
	  enable = true;
	  wireplumber.enable = true;
	  pulse.enable = true;
	}
  };

  hardware = {
    bluetooth.enable = true;
  };

  environment = {
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    systemPackages = with pkgs; [
      git
	  nvim
      w3m
    ];
  };

  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  system.stateVersion = "22.05";

}
