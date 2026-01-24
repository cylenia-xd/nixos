{ pkgs, ... }: {
  hm.home.packages = with pkgs; [
    wl-clipboard
    cliphist
  ];
}
