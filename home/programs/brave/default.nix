{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
    extensions = [
      "enpfonmmpgoinjpglildebkaphbhndek" # Tokyo Night Theme
      "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
      "kekjfbackdeiabghhcdklcdoekaanoel" # MAL-Sync
    ];
  };
}
