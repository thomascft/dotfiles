{ config, lib, pkgs, ... }: {
  xdg.configFile = {
    nvim = {
      source = ./conf;
      recursive = true;
    };
  };
}
