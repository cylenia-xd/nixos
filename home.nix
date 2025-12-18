{ config, pkgs, fjordlauncher, ... }: {
  home.packages = with pkgs; [
    android-tools
    fjordlauncher.packages.${pkgs.system}.fjordlauncher
  ];

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

  # don't change this!
  home.stateVersion = "25.11";
}

