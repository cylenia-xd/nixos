{ config, pkgs, ... }: {
  programs.waybar = {
    enable = true;
    settings = {
      layer = "top";
      position = "top";
      autohide = true;
      autohide-blocked = false;
      exclusive = true;
      passthrough = false;
      gtk-layer-shell = true;
      modules-left = [
        "clock"
      ];
      modules-center = [
        "niri/workspaces"
      ];
      modules-right = [
        "battery"
      ];
      "clock" = {
        interval = 1;
        timezone = "Australia/Melbourne";
        format = "{:%H:%M:%S %d/%m/%Y}";
        tooltip-format = "{calendar}";
        calendar = {
          mode = "month";
        };
      };
      "niri/workspaces" = {
        format = "{icon}";
        format-icons = {
          "1" = "1";
          "2" = "2";
          "3" = "3";
          "4" = "4";
          "5" = "5";
          "6" = "6";
          "7" = "7";
          "8" = "8";
          "9" = "9";
        };
        disable-scroll = true;
        all-outputs = true;
        show-special = true;
      };
      "battery" = {
        format = "{capacity}%";
      };
    };
    style = ''
    * {
      border: none;
      font-family: "Hack Nerd Font Mono";
      font-size: 15px;
      min-height: 10px;
    }

    window#waybar {
      background: #1e1e2e;
      border-bottom: solid 2px #cba6f7;
    }

    window#waybar.hidden {
      opacity: 0.2;
    }

    #clock,
    #workspaces,
    #battery {
      color: #cba6f7;
      padding-left: 10px;
      padding-right: 10px;
      transition: none;
      margin-left: 5px;
      margin-right: 5px;
      border-radius: 10px;
    }

    #workspaces button {
      color: #cba6f7;
      background: none;
      margin: 0;
      padding: 4px;
      border: none;
      border-radius: 0;
      box-shadow: none;
      transition: none;
    }

    #workspaces button.active {
      background: #cba6f7;
      color: #1e1e2e
    }
    '';
  };
}
