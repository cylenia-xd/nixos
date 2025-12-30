{ config, pkgs, lib, ... }: {
  programs.nushell = {
    enable = true;
    environmentVariables = {
      TRANSIENT_PROMPT_COMMAND = "";
      PROMPT_COMMAND_RIGHT = "";
      PROMPT_INDICATOR = " > ";
      PROMPT_INDICATOR_VI_NORMAL = " n ";
      PROMPT_INDICATOR_VI_INSERT = " i ";
    };
    settings = {
      show_banner = false;
      buffer_editor = "hx";
      table.mode = "single";
    };
    shellAliases = {
      vi = "hx";
      vim = "hx";
      nano = "hx";
    };
  };
}
