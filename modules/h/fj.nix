{ pkgs, ... }: {
  home.packages = with pkgs; [ forgejo-cli ];
  programs.bash.shellAliases.fj = "fj -H codeberg.org";
}
