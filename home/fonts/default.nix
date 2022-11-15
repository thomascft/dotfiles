{ config, lib, pkgs, ... }: {

  fonts.fontconfig.enable = true;

  home.packages = [
    pkgs.iosevka
    pkgs.victor-mono
    (pkgs.nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; } )
    pkgs.noto-fonts
    pkgs.noto-fonts-cjk
    pkgs.noto-fonts-emoji
  ];
}
