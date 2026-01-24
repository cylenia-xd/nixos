{ pkgs, ... }: {
  imports = [
    ./git.nix
    ./ssh.nix
    ./fastfetch.nix
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
