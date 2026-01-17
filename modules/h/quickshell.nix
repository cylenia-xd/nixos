{ ... }: {
  programs.quickshell = {
    enable = true;
    activeConfig = null;
  };

  home.file.quickshell = {
    enable = true;
    executable = true;
    target = ".config/quickshell";
    source = ../../assets/quickshell;
  };

  home.file.qs_workspaces = {
    enable = true;
    executable = true;
    target = ".bin/qs_workspaces";
    text = ''
      #!/usr/bin/env bash
      
      niri msg -j workspaces | jq -r '
        sort_by(.idx)
        | map(
            if .is_active
            then "<\(.idx)>"
            else "[\(.idx)]"
            end
          )
        | join(" ")
      '
    '';
  };
}
