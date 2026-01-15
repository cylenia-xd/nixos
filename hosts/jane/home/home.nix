{ pkgs, ... }: {
  imports = [
    ./modules/git.nix
    ./modules/fastfetch.nix
    ./modules/waybar.nix
    ./modules/kitty.nix
    ./modules/mako.nix
    ./modules/bash.nix
    ./modules/fuzzel.nix
    ./modules/niri.nix
    ./modules/neomutt.nix
    ./modules/helix.nix
    ./modules/librewolf.nix
    ./modules/dprint.nix
    ./modules/ssh.nix
    ./modules/starship.nix
    ./modules/quickshell/quickshell.nix
  ];

  home.packages = with pkgs; [
    android-tools
    swaybg
    wl-clipboard
    xdg-user-dirs
    cliphist
    p7zip
    dprint
    nerd-fonts.hack
    prismlauncher
    pulsemixer
    bluetui
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
