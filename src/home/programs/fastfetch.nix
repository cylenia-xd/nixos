{ config, pkgs, ... }: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "~/nixos/assets/ascii.txt";
        padding = {
          top = 1;
          right = 1;
        };
        color = {
          "1" = "#cba6f7";
        };
      };
      display.color.key = "#cba6f7";
      modules = [
        {
          type = "break";
        }
        {
          type = "custom";
          format = "{##cba6f7}┌──────────────────────────────────────────────────────┐";
        }
        {
          type = "cpu";
          key = "  CPU";
        }
        {
          type = "gpu";
          key = "  GPU";
        }
        {
          type = "memory";
          key = "  RAM";
        }
        {
          type = "disk";
          key = "  DISK";
        }
        {
          type = "os";
          key = "  OS";
        }
        {
          type = "kernel";
          key = "  KRNL";
        }
        {
          type = "shell";
          key = "  SH";
        }
        {
          type = "wm";
          key = "  WM";
        }
        {
          type = "command";
          key = "  AGE";
          text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
        }
        {
          type = "uptime";
          key = "  UP";
        }
        {
          type = "custom";
          format = "{##cba6f7}└──────────────────────────────────────────────────────┘";
        }
        {
          type = "break";
        }
        {
          type = "colors";
          symbol = "@";
          key = " ";
        }
      ];
    };
  };
}
