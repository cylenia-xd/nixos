{ config, pkgs, lib, ... }: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    programs.bash.enableVteIntegration = true;
    sessionVariables = {
      PS1 = " \\u@\\h:\\W\\$ ";
      EDITOR = "hx";
    };
  };
}
