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
}
