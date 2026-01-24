{ pkgs, inputs, ... }: {
  imports = [
    "${inputs.self}/modules/home/git.nix"
    "${inputs.self}/modules/home/fastfetch.nix"
    "${inputs.self}/modules/home/shell.nix"
    "${inputs.self}/modules/home/neomutt.nix"
    "${inputs.self}/modules/home/ssh.nix"
    "${inputs.self}/modules/home/tools.nix"
    "${inputs.self}/modules/home/desktop"
    "${inputs.self}/modules/home/editor"
  ];

  home.packages = with pkgs; [
    nerd-fonts.hack
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

  # don't change this!
  home.stateVersion = "25.11";
}
