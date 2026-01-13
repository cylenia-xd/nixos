{ pkgs, ... }: {
  home.packages = with pkgs; [
    git
    helix
    fastfetch
  ];

  # don't change this!
  home.stateVersion = "25.11";
}
