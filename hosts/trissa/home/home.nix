{ config, pkgs, inputs, ... }: {
  imports = [
    ./programs/git.nix
    ./programs/vesktop.nix
    ./programs/fastfetch.nix
    ./programs/waybar.nix
    ./programs/kitty.nix
    ./programs/mako.nix
    ./programs/nushell.nix
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
    discordo
    wl-clipboard
    cliphist
    qbittorrent
    nerd-fonts.hack
    libnotify
    sops
    mpv
  ];

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    desktop = ".hiddenxdg/desktop";
    documents = "documents";
    download = "downloads";
    music = ".hiddenxdg/music";
    pictures = "media/pictures";
    publicShare = ".hiddenxdg/public";
    templates = ".hiddenxdg/templates";
    videos = "media/videos";
  };

  # don't change this!
  home.stateVersion = "25.11";
}
