{lib, config, pkgs, ... }:

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
	shell = pkgs.zsh;
	extraGroups = ["wheel"];
  };

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
    opengl.enable = true;
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
  };

  system.stateVersion = "22.05";

}
