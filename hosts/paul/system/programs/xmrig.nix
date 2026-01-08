{ config, pkgs, ... }: {
  services.xmrig = {
    enable = true;
    settings = {
      autosave = true;
      cpu = true;
      opencl = false;
      cuda = false;
      pools = [{
        url = "monerohash.com:9999";
        user = "84dUQTBStjBXyx2E2j6gMdXdccjeKgGEFCTggqySjRrU8ccRHT2Q7ZA7eL8ySFUzu6UgPntSf3PnwfjeAxoUjU45CFAHiXS";
        keepalive = true;
        tls = true;
      }];
    };
  };
}
