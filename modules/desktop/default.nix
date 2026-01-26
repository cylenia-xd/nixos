{ pkgs, ... }: {
  imports = [
    ./audio.nix
    ./xdg.nix
    ./rice
    ./tools
  ];

  hm.home.packages = [
    pkgs.nerd-fonts.hack
  ];
  
  services.gnome.gnome-keyring.enable = true;
}
