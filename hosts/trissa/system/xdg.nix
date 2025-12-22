{ config, pkgs, ... }: {
  xdg.portal = {
    enable = lib.mkDefault true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      common.default = "gnome";
      niri.default = lib.mkForce "gnome";
      obs.default = "gnome";
    };
  };
}
