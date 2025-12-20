{ config, pkgs, ... }: {
  # i should probably properly nixify this at some point but im lowkey lazy
  programs.rofi = {
    enable = true;
    extraConfig = {
      "*" = {
        selected-normal-foreground = "#1e1e2e";           /* crust */
        foreground = "#cba6f7";                           /* mauve */
        normal-foreground = "@foreground";                  /* mauve */
        alternate-normal-background = "#00000000";        /* transparent */
        red = "#f38ba8";                                  /* red */
        selected-urgent-foreground = "#1e1e2e";           /* crust */
        blue = "#89b4fa";                                 /* blue */
        urgent-foreground = "#f38ba8";                    /* red */
        alternate-urgent-background = "#00000000";        /* transparent */
        active-foreground = "#cba6f7";                    /* mauve */
        lightbg = "#313244";                              /* surface0 */
        selected-active-foreground = "#1e1e2e";           /* crust */
        alternate-active-background = "#00000000";        /* transparent */
        background = "#1e1e2e";                           /* crust */
        bordercolor = "#cba6f7";                          /* mauve */
        alternate-normal-foreground = "@foreground";        /* mauve */
        normal-background = "#00000000";                  /* transparent */
        lightfg = "#b4befe";                              /* lavender */
        selected-normal-background = "#a78bda";           /* darker mauve */
        border-color = "@bordercolor";                      /* mauve */
        spacing = 2;                                        /* two */
        separatorcolor = "#cba6f7";                       /* mauve */
        urgent-background = "#00000000";                  /* transparent */
        selected-urgent-background = "#f38ba8";           /* red */
        alternate-urgent-foreground = "@urgent-foreground"; /* red */
        background-color = "#00000000";                   /* transparent */
        alternate-active-foreground = "@active-foreground"; /* mauve */
        #active-background = "#00000000";                  /* transparent */
        selected-active-background = "#a78bda";           /* darker mauve */
      };
      window = {
        background-color = "@background";
        border = 2;
        padding = 5;
      };
      mainbox = {
        border = 0;
        padding = 0;
      };
      message = {
        border = "2px 0px 0px";
        border-color = "@separatorcolor";
        padding = "1px";
      };
      textbox = {
        text-color = "@foreground";
      };
      listview = {
        fixed-height = 0;
        border = "2px 0px 0px";
        border-color = "@separatorcolor";
        spacing = "2px";
        scrollbar = true;
        padding = "2px 0px 0px";
      };
      element = {
        border = 0;
        padding = "1px";
      };
      element-text = {
        background-color = "inherit";
        text-color = "inherit";
      };
      element.normal.normal = {
        background-color = "@normal-background";
        text-color = "@normal-foreground";
      };
      element.normal.urgent = {
        background-color = "@urgent-background";
        text-color = "@urgent-foreground";
      };
      element.normal.active = {
        background-color = "@active-background";
        text-color = "@active-foreground";
      };
      element.selected.normal = {
        background-color = "@selected-normal-background";
        text-color = "@selected-normal-foreground";
      };
      element.selected.urgent = {
        background-color = "@selected-urgent-background";
        text-color = "@selected-urgent-foreground";
      };
      element.selected.active = {
        background-color = "@selected-active-background";
        text-color = "@selected-active-foreground";
      };
      element.alternate.normal = {
        background-color = "@alternate-normal-background";
        text-color = "@alternate-normal-foreground";
      };
      element.alternate.urgent = {
        background-color = "@alternate-urgent-background";
        text-color = "@alternate-urgent-foreground";
      };
      element.alternate.active = {
        background-color = "@alternate-active-background";
        text-color = "@alternate-active-foreground";
      };
      scrollbar = {
        width = "4px";
        border = 0;
        handle-width = "8px";
        padding = 0;
      };
      mode-switcher = {
        border = "2px 0px 0px";
        border-color = "@separatorcolor";
      };
      button.selected = {
        background-color = "@selected-normal-background";
        text-color = "@selected-normal-foreground";
      };
      inputbar = {
        spacing = 0;
        text-color = "@normal-foreground";
        padding = "1px";
      };
      case-indicator = {
        spacing = 0;
        text-color = "@normal-foreground";
      };
      entry = {
        spacing = 0;
        text-color = "@normal-foreground";
        placeholder = "Search...";
      };
      prompt = {
        spacing = 0;
        text-color = "@normal-foreground";
      };
      inputbar = {
        children = [
          "prompt"
          "textbox-prompt-colon"
          "entry"
          "case-indicator"
        ];
      };
      textbox-prompt-colon = {
        expand = false;
        str = ":";
        margin = "0px 0.3em 0em 0em";
        text-color = "@normal-foreground";
      };
    };
  };
}
