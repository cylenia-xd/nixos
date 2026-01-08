{ config, pkgs, ... }: {
  services.monero = {
    enable = true;
    prune = true;
    mining = {
      enable = true;
      address = "84dUQTBStjBXyx2E2j6gMdXdccjeKgGEFCTggqySjRrU8ccRHT2Q7ZA7eL8ySFUzu6UgPntSf3PnwfjeAxoUjU45CFAHiXS";
      threads = 0; # all available - maybe reconsider this later
    };
  };
}
