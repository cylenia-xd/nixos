{ ... }: {
  hm.programs.quickshell = {
    enable = true;
    activeConfig = null;
  };

  hm.home.file.quickshell = {
    enable = true;
    executable = true;
    target = ".config/quickshell";
    source = ../../assets/quickshell;
  };
}
