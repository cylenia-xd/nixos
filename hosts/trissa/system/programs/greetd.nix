{ config, pkgs, ... }: {
  services.greetd = {
    enable = true;
    settings = {
      terminal.vt = 1;
      default_session = {
        command = "agreety --cmd /bin/sh";
        user = "greeter";
      };
      initial_session = {
        command = "niri-session";
        user = "cylenia";
      };
    };
  };
}
