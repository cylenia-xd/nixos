{ ... }: {
  programs.git = {
    enable = true;
    signing = {
      format = "ssh";
      key = "~/.ssh/id_ed25519";
      signByDefault = true;
    };
    settings = {
      user = {
        name = "cylenia";
        email = "me@cylenia.dev";
      };
    };
  };
}
