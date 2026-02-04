{ config, ... }: {
  sops.secrets.pangolin_env = {};
  services.newt = {
    enable = true;
    environmentFile = config.sops.secrets.pangolin_env.path;
    settings = {
      endpoint = "https://pangolin.cylenia.dev";
    };
  };
}
