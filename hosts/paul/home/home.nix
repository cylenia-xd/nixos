{ config, pkgs, inputs, ... }: {
  imports = [
    ./programs/git.nix
  ];

  home.packages = with pkgs; [];

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
