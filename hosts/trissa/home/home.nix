{ config, pkgs, inputs, ... }: {
  imports = [
    ./programs/git.nix
    ./programs/vesktop.nix
    ./programs/fastfetch.nix
    ./programs/waybar.nix
    ./programs/kitty.nix
    ./programs/mako.nix
    ./programs/bash.nix
    ./programs/wofi.nix
    ./programs/niri.nix
    ./programs/neomutt.nix
    ./programs/helix.nix
    ./programs/element.nix
    ./programs/librewolf.nix
  ];

  home.packages = with pkgs; [
    android-tools
    prismlauncher
    swaybg
    wl-clipboard
    xdg-user-dirs
    cliphist
    varia
    lutris
    gamescope
    p7zip
    nerd-fonts.hack
    libnotify
    sops
    mpv
    jq
  ];

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    desktop = "/home/cylenia/.hiddenxdg/desktop";
    documents = "/home/cylenia/documents";
    download = "/home/cylenia/downloads";
    music = "/home/cylenia/.hiddenxdg/music";
    pictures = "/home/cylenia/media/pictures";
    publicShare = "/home/cylenia/.hiddenxdg/public";
    templates = "/home/cylenia/.hiddenxdg/templates";
    videos = "/home/cylenia/media/videos";
  };

  # don't change this!
  home.stateVersion = "25.11";
}
