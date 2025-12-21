{ config, pkgs, lib, ... }: {
  programs.zsh = {
    enable = true;
    envExtra = ''
    export EDITOR="hx"
    export MANPAGER="nvim +Man!"
    export PAGER="less"
    export PATH=$PATH:~/.dotsbin
    '';
    enableCompletion = true;
    shellAliases = {
      ls = "ls --color=auto";
      grep = "grep --color=auto";
      ff = "fastfetch";
      tree = "tree -F";
    };
    initContent = lib.mkOrder 1500 ''
    PROMPT="%~ > "
    bindkey -v
    '';
  };
}
