{ ... }: {
  programs.git = {
    enable = true;
    signing = {
      format = "ssh";
      key = "SHA256:7iw5hnvtd1eHpmhRotyBpX0YHCbCAQYzED+DATnz3/E";
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
