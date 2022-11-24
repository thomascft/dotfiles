{ config, lib, pkgs, ... }: {

  fonts.fontconfig.enable = true;

  home.packages = [
    pkgs.iosevka
	pkgs.sarasa-gothic # CJK font based on Iosevka
    pkgs.victor-mono
    (pkgs.nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; } )
    pkgs.noto-fonts
    pkgs.noto-fonts-cjk
    pkgs.noto-fonts-emoji
  ];
}
