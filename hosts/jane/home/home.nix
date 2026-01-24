{ pkgs, inputs, ... }: {
  imports = [
    "${inputs.self}/modules/h/git.nix"
    "${inputs.self}/modules/h/fastfetch.nix"
    "${inputs.self}/modules/h/foot.nix"
    "${inputs.self}/modules/h/mako.nix"
    "${inputs.self}/modules/h/shell.nix"
    "${inputs.self}/modules/h/niri.nix"
    "${inputs.self}/modules/h/neomutt.nix"
    "${inputs.self}/modules/h/helix.nix"
    "${inputs.self}/modules/h/firefox.nix"
    "${inputs.self}/modules/h/dprint.nix"
    "${inputs.self}/modules/h/ssh.nix"
    "${inputs.self}/modules/h/quickshell.nix"
    "${inputs.self}/modules/h/fuzzel.nix"
    "${inputs.self}/modules/h/clipboard.nix"
    "${inputs.self}/modules/h/tools.nix"
    "${inputs.self}/modules/h/fj.nix"
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
