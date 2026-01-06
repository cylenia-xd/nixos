{ config, pkgs, lib, inputs, ... }: {
  imports = [ inputs.nixcraft.homeModules.default ];

  config.nixcraft = {
    enable = true;
    server.instances = {};
    client = {
      shared = {
        account = {
          username = "XwX";
          uuid = "00000000-0000-0000-0000-000000000000";
          offline = true;
        };
      };
      instances = {
        warpium = {
          enable = true;
          fabricLoader = {
            enable = true;
            version = "0.18.4";
          };
          version = "1.21.11";
          files = {
            "mods/fabric-api.jar".source = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/DdVHbeR1/fabric-api-0.141.1%2B1.21.11.jar";
              hash = "";
            };
            "mods/sodium.jar".source = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/AANobbMI/versions/59wygFUQ/sodium-fabric-0.8.2%2Bmc1.21.11.jar";
              hash = "";
            };
            "mods/lithium.jar".source = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/gl30uZvp/lithium-fabric-0.21.2%2Bmc1.21.11.jar";
              hash = "";
            };
            "mods/meteor-client.jar".source = pkgs.fetchurl {
              url = "https://meteorclient.com/api/download?version=1.21.11";
              hash = "";
            };
          };
          java = {
            package = pkgs.jdk21;
            maxMemory = 4000;
            minMemory = 4000;
          };
          binEntry = {
            enable = true;
            name = "warpium";
          };
          desktopEntry = {
            enable = true;
            name = "Warpium";
            extraConfig.terminal = true;
          };
        };
      };
    };
  };
}
