{ config, pkgs, lib, ... }: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    sessionVariables.EDITOR = "hx";
  };
}
