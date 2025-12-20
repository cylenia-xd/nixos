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
#        color = {
#          "1" = "#cba6f7";
#        };
      };
      modules = [
        break
        {
          type = "custom";
          format = "\u001b[90m┌──────────────────────────────────────────────────────┐";
        }
        {
          type = "host";
          key = "  MB";
          keyColor = "#cba6f7";
        }
        {
          type = "cpu";
          key = "  CPU";
          keyColor = "#cba6f7";
        }
        {
          type = "cpuusage";
          key = "   └ USAGE";
          keyColor = "#cba6f7";
        }
        {
          type = "gpu";
          key = "  GPU";
          keyColor = "#cba6f7";
        }
        {
          type = "memory";
          key = "  RAM";
          keyColor = "#cba6f7";
        }
        {
          type = "swap";
          key = "  SWAP";
          keyColor = "#cba6f7";
        }
        {
          type = "disk";
          key = "  DISK";
          keyColor = "#cba6f7";
        }
        {
          type = "os";
          key = "  OS";
          keyColor = "#cba6f7";
        }
        {
          type = "kernel";
          key = "  KRNL";
          keyColor = "#cba6f7";
        }
        {
          type = "bios";
          key = "  BIOS";
          keyColor = "#cba6f7";
        }
        {
          type = "packages";
          key = "  PKGS";
          keyColor = "#cba6f7";
        }
        {
          type = "shell";
          key = "  SH";
          keyColor = "#cba6f7";
        }
        {
          type = "lm";
          key = "  LM";
          keyColor = "#cba6f7";
        }
        {
          type = "wm";
          key = "  WM";
          keyColor = "#cba6f7";
        }
        {
          type = "terminal";
          key = "  TERM";
          keyColor = "#cba6f7";
        }
        {
          type = "command";
          key = "  AGE";
          keyColor = "#cba6f7";
          text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
        }
        {
          type = "uptime";
          key = "  UP";
          keyColor = "#cba6f7";
        }
        {
          type = "datetime";
          key = "  D/T";
          keyColor = "#cba6f7";
        }
        {
          type = "initsystem";
          key = "  INIT";
          keyColor = "#cba6f7";
        }
        {
          type = "custom";
          format = "\u001b[90m└──────────────────────────────────────────────────────┘";
        }
      ];
    };
  };
}
