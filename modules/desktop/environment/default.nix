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

  hm.catppuccin.cursors = {
    enable = true;
    accent = "mauve";
    flavor = "mocha";
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
