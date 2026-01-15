{ ... }: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = true;
    extraConfig = ''
      Host greg
        Hostname 192.227.173.19
        Port 22
        User root
        SetEnv TERM=xterm-256color

      Host paul
        Hostname 192.168.86.50
        Port 22
        User cylenia
        SetEnv TERM=xterm-256color
    '';
  };
}
