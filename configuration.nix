{config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot/efi";
  };

  networking = {
    hostName = "nixos";
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
	};
  };

  hardware = {
    bluetooth.enable = true;
    opengl.enable = true;
  };

  environment = {
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    systemPackages = with pkgs; [
      git
      neovim
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
