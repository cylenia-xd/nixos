{ config, pkgs, ... }: {
  programs.vesktop = {
    enable = true;
    settings = {
      arRPC = true;
      checkUpdates = false;
      minimizeToTray = false;
      tray = false;
    };
  };
}
