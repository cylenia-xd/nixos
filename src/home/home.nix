{ config, pkgs, inputs, ... }: {
  imports = [
    ./programs/git.nix
    ./programs/vesktop.nix
    ./programs/fastfetch.nix
  ];

  home.packages = with pkgs; [
    android-tools
    inputs.freesmlauncher.packages.${pkgs.stdenv.hostPlatform.system}.freesmlauncher
    stow
    fastfetch
    kitty
    mako
    neomutt
    neovim
    rofi
    swaybg
    wl-clipboard
    cliphist
    qbittorrent
    nerd-fonts.hack
    libnotify
    mpv
  ];

  programs.waybar.enable = true;

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

