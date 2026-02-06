{ pkgs, ... }: {
  imports = [
    ./clipboard.nix
    ./firefox.nix
    ./greetd.nix
    ./kitty.nix
    ./mako.nix
    ./hyprland.nix
    ./fuzzel.nix
    ./quickshell
  ];

  environment.systemPackages = [
    pkgs.nerd-fonts.hack
  ];

  programs.hyprland.enable = true;

  hm.home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  hm.gtk = {
    enable = true;

    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      package = pkgs.nerd-fonts.hack;
      name = "Hack Nerd Font Mono";
      size = 12;
    };
  };
}
