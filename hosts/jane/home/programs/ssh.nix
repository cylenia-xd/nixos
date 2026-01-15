{ ... }: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      greg = {
        hostname = "192.227.173.19";
        port = 22;
        user = "root";
        sendEnv = [ "TERM=xterm-256color" ];
      };
      paul = {
        hostname = "192.168.86.50";
        port = 22;
        user = "cylenia";
        sendEnv = [ "TERM=xterm-256color" ];
      };
    };
  };
}
