{ ... }: {
  imports = [
    ./clipboard.nix
    ./firefox.nix
    ./fuzzel.nix
    ./greetd.nix
    ./kitty.nix
    ./mako.nix
    ./editor.nix
    ./neomutt.nix
    ./niri.nix
    ./quickshell
  ];

  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    xwayland-satellite
  ];

  programs.niri.enable = true;

  qt = {
    enable = true;
    style = "adwaita-dark";
    platformTheme = "gnome";
  };
}
