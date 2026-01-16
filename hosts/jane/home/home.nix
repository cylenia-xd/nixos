{ pkgs, self, ... }: {
  imports = [
    "${self}/modules/h/git.nix"
    "${self}/modules/h/fastfetch.nix"
    "${self}/modules/h/kitty.nix"
    "${self}/modules/h/mako.nix"
    "${self}/modules/h/bash.nix"
    "${self}/modules/h/fuzzel.nix"
    "${self}/modules/h/niri.nix"
    "${self}/modules/h/neomutt.nix"
    "${self}/modules/h/helix.nix"
    "${self}/modules/h/librewolf.nix"
    "${self}/modules/h/dprint.nix"
    "${self}/modules/h/ssh.nix"
    "${self}/modules/h/starship.nix"
    "${self}/modules/h/quickshell/quickshell.nix"
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
