{ config, pkgs, inputs, ... }: {
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
    nerd-fonts.hack
    libnotify
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "cylenia";
        email = "me@cylenia.dev";
        signingkey = "8211F845B5FB45BE";
      };
      commit.gpgsign = true;
    };
  };

  programs.waybar.enable = true;

  programs.firefox.enable = true;

  programs.vesktop = {
    enable = true;
    settings = {
      arRPC = true;
      checkUpdates = false;
      minimizeToTray = false;
      tray = false;
    };
  };

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

