{ ... }: {
  home.file.niri = {
    enable = true;
    target = ".config/niri/config.kdl";
    text = ''
    input {
      keyboard {
        xkb {
          layout "gb"
        }
      }
      touchpad {
        disabled-on-external-mouse
      }
      trackpoint {
        off
      }
    }

    gestures {
      hot-corners {
        off
      }
    }

    output "HDMI-A-1" {
      mode "1920x1080"
      scale 1
      transform "normal"
      position x=0 y=0
    }

    layout {
      gaps 10
      center-focused-column "never"
      preset-column-widths {
        proportion 0.33333
        proportion 0.5
        proportion 0.66667
        proportion 1.0
      }
      preset-window-heights {
        proportion 0.33333
        proportion 0.5
        proportion 0.66667
        proportion 1.0
      }
      default-column-width { proportion 0.5; }
      focus-ring {
        width 2
        active-color "#cba6f7"
        inactive-color "#45475a"
      }
      border {
        off
      }
    }

    spawn-at-startup "quickshell"
    spawn-sh-at-startup "swaybg -i ~/nixos/assets/wallpaper.jpg -o \"*\" -m stretch"
    spawn-sh-at-startup "wl-paste --type text --watch cliphist store"
    spawn-sh-at-startup "wl-paste --type image --watch cliphist store"
    spawn-at-startup "mako"

    hotkey-overlay {
      skip-at-startup
    }

    prefer-no-csd
    screenshot-path null

    window-rule {
      match app-id="firefox" title="^Picture-in-Picture$"
      open-floating true
    }

    binds {
      Mod+T { spawn "kitty"; }
      Mod+D { spawn "qs" "ipc" "call" "dashboard" "toggle"; }
      Mod+V { spawn-sh "cliphist list | fuzzel --dmenu --with-nth 2 | cliphist decode | wl-copy"; }
      Mod+Q repeat=false { close-window; }

      Mod+Left  { focus-column-left; }
      Mod+Down  { focus-window-down; }
      Mod+Up    { focus-window-up; }
      Mod+Right { focus-column-right; }

      Mod+Ctrl+Left  { move-column-left; }
      Mod+Ctrl+Down  { move-window-down; }
      Mod+Ctrl+Up    { move-window-up; }
      Mod+Ctrl+Right { move-column-right; }

      Mod+Page_Down      { focus-workspace-down; }
      Mod+Page_Up        { focus-workspace-up; }
      Mod+1              { focus-workspace 1; }
      Mod+2              { focus-workspace 2; }
      Mod+3              { focus-workspace 3; }
      Mod+4              { focus-workspace 4; }
      Mod+5              { focus-workspace 5; }
      Mod+Ctrl+Page_Down { move-column-to-workspace-down; }
      Mod+Ctrl+Page_Up   { move-column-to-workspace-up; }

      Mod+BracketLeft  { consume-or-expel-window-left; }
      Mod+BracketRight { consume-or-expel-window-right; }

      Mod+Comma  { consume-window-into-column; }
      Mod+Period { expel-window-from-column; }

      Mod+R { switch-preset-column-width; }
      Mod+Ctrl+R { switch-preset-window-height; }
      Mod+Shift+F { fullscreen-window; }
      Mod+Ctrl+F { expand-column-to-available-width; }

      Mod+C { center-column; }
      Mod+Ctrl+C { center-visible-columns; }

      Mod+F       { toggle-window-floating; }
      Mod+W { toggle-column-tabbed-display; }

      Print { screenshot; }
      Ctrl+Print { screenshot-screen; }
      Alt+Print { screenshot-window; }

      Mod+Shift+E { quit; }
      Mod+Shift+P { power-off-monitors; }
    }
    '';
  };
}
