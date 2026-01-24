{ pkgs, ... }: {
  imports = [
    ./clipboard.nix
    ./firefox.nix
    ./fuzzel.nix
    ./greetd.nix
    ./kitty.nix
    ./mako.nix
    ./neomutt.nix
    ./niri.nix
    ./quickshell.nix
    ./xdg.nix
    ./editor.nix
    ./tools
  ];

  hm.home.packages = [
    pkgs.nerd-fonts.hack
  ];
  
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    xwayland-satellite
  ];

  programs.niri.enable = true;
  services.gnome.gnome-keyring.enable = true;

  qt = {
    enable = true;
    style = "adwaita-dark";
    platformTheme = "gnome";
  };

  boot.plymouth = {
    enable = true;
    theme = "bgrt";
  };
}
