{ pkgs, ... }: {
  imports = [
    ./audio.nix
    ./editor.nix
    ./neomutt.nix
    ./xdg.nix
    ./wayland
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
}
