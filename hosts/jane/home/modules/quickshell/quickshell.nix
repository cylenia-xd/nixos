{ ... }: {
  programs.quickshell = {
    enable = true;
    activeConfig = "default";
    configs.default = ./configs/default;
  };
}
