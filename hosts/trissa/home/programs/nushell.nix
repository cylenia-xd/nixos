{ config, pkgs, lib, ... }: {
  programs.nushell = {
    enable = true;
    environmentVariables = {
      TRANSIENT_PROMPT_COMMAND = "";
    };
    settings = {
      show_banner = false;
      buffer_editor = "hx";
    };
    shellAliases = {
      vi = "hx";
      vim = "hx";
      nano = "hx";
    };
  };
}
