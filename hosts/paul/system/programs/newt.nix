{ config, pkgs, ... }: {
  services.newt = {
    enable = true;
    environmentFile = config.sops.secrets.pangolin_env.path;
    settings = {
      endpoint = "pangolin.cylenia.dev";
    };
  };
}
