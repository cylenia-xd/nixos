{ ... }: {
  services.jellyfin = {
    enable = true;
    hardwareAcceleration.enable = true;
  };
}
