{ ... }: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    shellAliases.rebuild = "sudo nixos-rebuild switch";
    shellAliases.ls = "ls -h --color --group-directories-first";
  };
}
