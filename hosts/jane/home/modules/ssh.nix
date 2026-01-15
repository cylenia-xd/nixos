{ ... }: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      greg = {
        hostname = "192.227.173.19";
        port = 22;
        user = "root";
        setEnv.TERM = "xterm-256color";
      };
      paul = {
        hostname = "192.168.86.50";
        port = 22;
        user = "cylenia";
        setEnv.TERM = "xterm-256color";
      };
    };
  };
}
