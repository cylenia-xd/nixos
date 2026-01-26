{ ... }: {
  imports = [
    ./audio.nix
    ./xdg.nix
    ./rice
    ./tools
  ];

  services.gnome.gnome-keyring.enable = true;
}
