{ pkgs, inputs, ... }: {
  hm = {
    imports = [
      inputs.nixcraft.homeModules.default
    ];

    config.nixcraft = {
      enable = true;

      client = {
        shared = {
          binEntry.enable = true;
          account = {
            username = "Skibidi";
            uuid = "00000000-0000-0000-0000-000000000000";
            offline = true;
          };
        };

        instances = {
          simop-mc = {
            enable = true;
            mrpack = {
              enable = true;
              file = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/BYfVnHa7/versions/vZZwrcPm/Simply%20Optimized-1.21.1-5.0.mrpack";
                hash = "sha256-n2BxHMmqpOEMsvDqRRYFfamcDCCT4ophUw7QAJQqXmg=";
              };
            };
          };
        };
      };
    };
  };
}
