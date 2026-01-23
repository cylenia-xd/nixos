{ pkgs, ... }: {
  home.packages = with pkgs; [
    netcat-openbsd
    android-tools
    xdg-user-dirs
    p7zip
    pulsemixer
    bluetui
    sops
    tealdeer
    jq
  ];
}
