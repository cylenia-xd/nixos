{ config, pkgs, ... }: {
  environment.pathsToLink = [ "/share/zsh" ];
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    xwayland-satellite
    wine
    winetricks
  ];
}
