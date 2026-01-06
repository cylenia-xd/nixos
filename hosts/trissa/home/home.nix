{ config, pkgs, inputs, ... }: {
  imports = [
    ./programs/git.nix
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
    swaybg
    wl-clipboard
    xdg-user-dirs
    cliphist
    p7zip
    nerd-fonts.hack
    libnotify
    sops
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

  home.file.mailcap = {
    enable = true;
    executable = true;
    force = true;
    target = ".mailcap";
    text = "text/html; librewolf %s; nametemplate=%s.html";
  };

  # don't change this!
  home.stateVersion = "25.11";
}
