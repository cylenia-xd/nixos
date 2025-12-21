{ config, pkgs, inputs, ... }: {
  imports = [
    ./programs/git.nix
    ./programs/vesktop.nix
    ./programs/fastfetch.nix
    ./programs/waybar.nix
    ./programs/kitty.nix
    ./programs/mako.nix
    ./programs/zsh.nix
    ./programs/wofi.nix
    ./programs/niri.nix
    ./programs/neomutt.nix
    ./programs/helix.nix
  ];

  home.packages = with pkgs; [
    android-tools
    inputs.freesmlauncher.${pkgs.stdenv.hostPlatform.system}.freesmlauncher
    swaybg
    wl-clipboard
    cliphist
    qbittorrent
    nerd-fonts.hack
    libnotify
    mpv
  ];

  programs.firefox.enable = true;

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    desktop = "desktop";
    documents = "documents";
    download = "downloads";
    music = "music";
    pictures = "pictures";
    publicShare = "public";
    templates = "templates";
    videos = "videos";
  };

  # don't change this!
  home.stateVersion = "25.11";
}
