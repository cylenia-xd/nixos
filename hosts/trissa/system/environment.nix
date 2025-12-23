{ config, pkgs, ... }: {
  environment.pathsToLink = [ "/share/zsh" ];
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
  ];
}
