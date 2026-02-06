{ ... }: {
  hm.wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      general = {
        border_size = 2;
        gaps_in = 10;
        gaps_out = 10;
        col = {
          inactive_border = "rgb(45475a)";
          active_border = "rgb(cba6f7)";
        };
      };
      decoration.shadow.enabled = false;
      animations.enabled = false;
      exec-once = [
        "mako"
        "quickshell"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];
      bind = [
        "SUPER, T, exec, kitty"
        "SUPER, D, exec, fuzzel"
        "SUPER, E, exec, bash -c 'BEMOJI_PICKER_CMD=\"fuzzel -d\" bemoji -t'"
        "SUPER, V, exec, bash -c 'cliphist list | fuzzel --dmenu --with-nth 2 | cliphist decode | wl-copy'"
        "SUPER, Q, killactive"

        "SUPER, Left, movefocus, left"
        "SUPER, Right, movefocus, right"
        "SUPER, Down, movefocus, down"
        "SUPER, Up, movefocus, up"

        "SUPER CTRL, Left, movewindow, left"
        "SUPER CTRL, Right, movewindow, right"
        "SUPER CTRL, Down, movewindow, down"
        "SUPER CTRL, Up, movewindow, up"

        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"


        "SUPER CTRL, 1, movetoworkspace, 1"
        "SUPER CTRL, 2, movetoworkspace, 2"
        "SUPER CTRL, 3, movetoworkspace, 3"
        "SUPER CTRL, 4, movetoworkspace, 4"
        "SUPER CTRL, 5, movetoworkspace, 5"

        "SUPER ALT, 1, movetoworkspacesilent, 1"
        "SUPER ALT, 2, movetoworkspacesilent, 2"
        "SUPER ALT, 3, movetoworkspacesilent, 3"
        "SUPER ALT, 4, movetoworkspacesilent, 4"
        "SUPER ALT, 5, movetoworkspacesilent, 5"

        "SUPER, F, togglefloating"
        "SUPER CTRL, E, exec, hyprshutdown"
      ];
    };
  };
}
