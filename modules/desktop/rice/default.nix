{ pkgs, ... }: {
  imports = [
    ./clipboard.nix
    ./firefox.nix
    ./greetd.nix
    ./kitty.nix
    ./mako.nix
    ./editor.nix
    ./neomutt.nix
    ./niri.nix
    ./rofi
    ./quickshell
  ];

  hm.home.packages = [ pkgs.nerd-fonts.hack ];
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
