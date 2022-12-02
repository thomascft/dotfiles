{lib, config, pkgs, ... }:

{
  imports = [ ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
    };
	plymouth.enable = true;
	initrd.systemd.enable = true;
  };

  networking = {
	networkmanager.enable = true;
  };

  users.users.thomas = {
    isNormalUser = true;
	shell = pkgs.zsh;
	extraGroups = ["wheel"];
  };
  
  programs.ssh.startAgent = true;

  nixpkgs.config.allowUnfree = true; 
 
  security.pam.services.swaylock = {};
  security.polkit.enable = true;

  time.timeZone = "America/Denver";

  services = {
    pipewire = {
	  enable = true;
	  wireplumber.enable = true;
	  pulse.enable = true;
    };
	tlp.enable = true;
    dbus.enable = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    # gtk portal needed to make gtk apps happy
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  hardware = {
    bluetooth.enable = true;
    opengl = {
	  enable = true;
	  driSupport = true;
	  driSupport32Bit = true;
	};
    steam-hardware.enable = true;
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
	settings = {
	  substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
	};
  };

  system.stateVersion = "22.05";

}
