{ config, lib, pkgs, ... }: {
  imports = [
    ./hardware.nix
    ./boot.nix
    ./networking.nix
    ./localization.nix
    ./audio.nix
    ./xdg.nix
    ./nix.nix
    ./environment.nix
    ./programs/greetd.nix
    ./programs/gpg.nix
    ./programs/steam.nix
    ./programs/syncthing.nix
  ];

  users.users.cylenia = {
    isNormalUser = true;
    description = "Cylenia";
    shell = pkgs.bash;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  programs.niri.enable = true;
  services.gnome.gnome-keyring.enable = true;
  # stolen from nixos wiki
  programs.bash.interactiveShellInit = ''
    if [ "$TERM" = "xterm-kitty" ] && [ -z "$BASH_EXECUTION_STRING" ]; then
      exec nu
    fi
  '';

  qt = {
    enable = true;
    style = "adwaita-dark";
    platformTheme = "gnome";
  };

  # don't change this!
  system.stateVersion = "25.11";
}
