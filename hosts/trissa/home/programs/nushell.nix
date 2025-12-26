{ config, pkgs, lib, ... }: {
  programs.nushell = {
    enable = true;
    environmentVariables = {
      PROMPT_COMMAND = "pwd + \" > \"";
      TRANSIENT_PROMPT_COMMAND = "> ";
    };
    settings = {
      show_banner = false;
      buffer_editor = "hx";
    };
  };
}
