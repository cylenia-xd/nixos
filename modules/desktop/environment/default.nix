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
    pkgs.adwaita-icon-theme
    pkgs.nerd-fonts.hack
  ];

  programs.hyprland.enable = true;

  qt = {
    enable = true;
    style = "adwaita-dark";
    platformTheme = "gnome";
  };
}
