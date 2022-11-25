{config,lib, pkgs, ...}: {
  home.packages = with pkgs; [
    gimp
	inkscape
    mpv
  ];
}
