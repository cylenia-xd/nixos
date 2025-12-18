{ config, pkgs, inputs, ... }: {
  home.packages = with pkgs; [
    android-tools
    inputs.fjordlauncher.packages.${pkgs.stdenv.hostPlatform.system}.fjordlauncher
    stow
    fastfetch
    kitty
    mako
    neomutt
    neovim
    niri
    rofi
    waybar
    zsh
    swaybg
    wl-clipboard
    cliphist
    nerd-fonts.hack
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

  programs.vesktop = {
    enable = true;
    settings = {
      arRPC = true;
      checkUpdates = false;
      minimizeToTray = false;
      tray = false;
    };
  };

  # don't change this!
  home.stateVersion = "25.11";
}

