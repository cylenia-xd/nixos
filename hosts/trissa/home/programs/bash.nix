{ config, pkgs, lib, ... }: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    sessionVariables = {
      PS1 = " \\u@\\h:\\W\\$ ";
      EDITOR = "hx";
    };
  };
}
