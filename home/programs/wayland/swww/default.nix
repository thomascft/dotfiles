{
  inputs,
  pkgs,
  lib,
  config,
  ...
}: {
  home.packages = [
    inputs.self.packages.x86_64-linux.swww
  ];
  systemd.user.services = {
    swww-daemon = {
    Unit = {
      Description = "swww, A salution to your Wayland Wallpaper Woes";
      Documentation = "https://github.com/Hourus645/swww";
      PartOf = ["graphical-session.target"];
      After = ["graphical-session.target"];
    };

    Service = {
      ExecStart = "${inputs.self.packages.x86_64-linux.swww}/bin/swww init --no-daemon";
      ExecReload = "${pkgs.coreutils}/bin/kill -SIGUSR2 $MAINPID";
      Restart = "on-failure";
      KillMode = "mixed";
    };
	Install = {
        WantedBy = [ "graphical-session.target" ];
		Also = ["swww-wallpaper.service"];
    };
    };
	swww-wallpaper = {
      Unit = {
        Description = "Default wallpaper for swww";
		PartOf = ["graphical-session.target"];
		After = ["swww-daemon.service"];
	  };

	  Service = {
	    ExecStart = "${inputs.self.packages.x86_64-linux.swww}/bin/swww img /home/thomas/.dotfiles/wallpaper.png";
	    ExecReload = "${inputs.self.packages.x86_64-linux.swww}/bin/swww img /home/thomas/.dotfiles/wallpaper.png";
		Restart = "on-failure";
        KillMode = "mixed";
	  };
	  Install = {
	    WantedBy = ["swww-daemon.service"];
	  };
	};
  };
}
