{ pkgs, ... }: {
  hm.nixcraft = {
    enable = true;

    server.instances = {};
    client = {
      shared = {
        binEntry.enable = true;
        account = {
          username = "Cylenia";
          uuid = "10636299-87c3-4ae0-b9a1-9ecb00282433";
          offline = true;
        };
      };

      instances = {
        create-plus = {
          enable = true;
          mrpack = {
            enable = true;
            file = pkgs.fetchurl {
              url = "https://cdn.modrinth.com/data/HqonU57y/versions/rlTgMYB4/Create%2B%203.1.1.mrpack";
            };
          };
        };
      };
    };
  };
}
