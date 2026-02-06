{ ... }: {
  imports = [
    ./audio.nix
    ./xdg.nix
    ./gaming.nix
    ./environment
    ./tools
  ];

  services.gnome.gnome-keyring.enable = true;
}
