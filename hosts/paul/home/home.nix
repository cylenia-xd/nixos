{ pkgs, ... }: {
  imports = [
    ./modules/helix.nix
  ];
  
  home.packages = with pkgs; [
    git
    fastfetch
  ];

  # don't change this!
  home.stateVersion = "25.11";
}
