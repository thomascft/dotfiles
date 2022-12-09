{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    initExtra = ''
      PS1=$'\n'"%S%n@%m%s %1~"$'\n\n'"  %S%#%s "
      bindkey -e
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
    '';
    profileExtra = ''
      if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
        systemd-inhibit --what handle-power-key Hyprland
      fi
    '';
	zplug = {
	  enable = true;
	  plugins = [
        {name = "zsh-users/zsh-syntax-highlighting"; }
	  ];
	};
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
