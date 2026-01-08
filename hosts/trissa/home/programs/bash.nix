{ config, pkgs, lib, ... }: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    shellAliases.rebuild = "sudo nixos-rebuild switch";
  };
}
