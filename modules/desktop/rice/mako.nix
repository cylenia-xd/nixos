{ pkgs, ... }: {
  hm.home.packages = with pkgs; [
    libnotify
  ];
  hm.services.mako = {
    enable = true;
    settings = {
      sort = "-time";
      layer = "overlay";
      background-color = "#1e1e2e";
      width = 300;
      height = 110;
      border-size = 2;
      border-color = "#cba6f7";
      border-radius = 0;
      icons = 0;
      max-icon-size = 64;
      default-timeout = 5000;
      ignore-timeout = 1;
      font = "monospace 14";
    };
  };
}
