# Install Guide

## System Setup

I Like [Artix](https://artixlinux.org/) which is an [Arch](https://archlinux.org/) fork with systemd alternaties. We'll be using the same init system as [Void](voidlinux.org) called runit.


1. Burn the ISO you chose to a usb drive with [Balena Etcher](https://www.balena.io/etcher/)

1. Boot and Install (Artix) using [Guide](https://wiki.artixlinux.org/Main/Installation  

	- I'll be using BTRFS with subvolumes and a seperate home partition.

	- Before you chroot to the new system install some important tools with `basestrap /mnt nvim git`
	
## User Setup

### Auomatic Install

W.I.P.

### Manual Install

1. Install Basics `pacman -Sy git zsh`

1. Install AUR Helper(I'll be using [paru](https://github.com/morganamilo/paru))

	- Clone paru to .cache `git clone https://aur.archlinux.org/paru.git .cache/paru-tmp`

	- Move to dir and build `cd ~/.cache/paru-tmp && makepkg -si`

1. Setup Desktop Enviroment `paru -Sy river waybar wofi eww-wayland-git wezterm firefox`

	- Setup firefox

		- Create profile with [ffprofile](https://ffprofile.com/)

		Or

		- Disable Telemetry and Install [UBlock Origin](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/)

1. Setup Tooling

	- Install and Setup Neovim `paru -S nvim neovide`

	- Install Extra Dependencies `paru -S ripgrep`

1. Install Media Stuff

	- Control Software `paru -S pamixer pipewire pipewire-pulse wireplumber playerctl`

	- PipeWire

		- Enable Services `systemctl enable --user --now wireplumber pipewire pipewire-pulse`

	- Setup Spotify

		* Install `paru -S spotify spicetify-cli`

		* Setup Spicetify `spicetify backup apply`

	- Setup mpd
			
		* Install `paru -S mpd && mpDris2`

		* Enable Services `systemctl enable --user mpDris2 mpd`
		
	- Graphics Software `paru -S gimp inkscape`
