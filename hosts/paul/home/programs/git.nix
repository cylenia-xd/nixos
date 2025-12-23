{ config, pkgs, ... }: {
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "cylenia";
        email = "me@cylenia.dev";
        signingkey = "8211F845B5FB45BE";
      };
      commit.gpgsign = true;
    };
  };
}
