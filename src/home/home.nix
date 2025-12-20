{ config, pkgs, inputs, ... }: {
  imports = [
    ./programs/git.nix
    ./programs/vesktop.nix
    ./programs/fastfetch.nix
    ./programs/waybar.nix
    ./programs/kitty.nix
    ./programs/mako.nix
    ./programs/zsh.nix
    ./programs/rofi.nix
  ];

  home.packages = with pkgs; [
    android-tools
    inputs.freesmlauncher.packages.${pkgs.stdenv.hostPlatform.system}.freesmlauncher
    stow
    neomutt
    neovim
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

