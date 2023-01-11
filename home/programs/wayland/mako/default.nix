{pkgs, lib, config, ...}:{
  programs.mako.enable = true;
  xdg.configFile."mako/config".source = ./config;

  systemd.user.services.mako = {
    Unit = {
      Description = "A lightweight Wayland notification daemon";
      Documentation = "https://github.com/emersion/mako";
      PartOf = ["graphical-session.target"];
      After = ["graphical-session.target"];
    };

    Service = {
      ExecStart = "${pkgs.mako}/bin/mako";
      ExecReload = "${pkgs.coreutils}/bin/kill -SIGUSR2 $MAINPID";
      Restart = "on-failure";
      KillMode = "mixed";
    };
	Install = {
        WantedBy = [ "graphical-session.target" ];
    };
  };
}
