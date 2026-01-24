{ pkgs, ... }: {
  imports = [
    ./fastfetch.nix
    ./git.nix
    ./ssh.nix
  ];
  
  hm.home.packages = with pkgs; [
    netcat-openbsd
    android-tools
    xdg-user-dirs
    p7zip
    pulsemixer
    bluetui
    sops
    tealdeer
    tree
    jq
  ];
}
