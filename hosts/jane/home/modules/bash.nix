{ ... }: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    shellAliases.rebuild = "sudo nixos-rebuild switch";
    shellAliases.ls = "ls -h --group-directories-first --color";
    sessionVariables = {
      PATH = "$PATH:$HOME/.bin";
    };
  };
}
