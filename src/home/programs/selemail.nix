{ config, pkgs, ... }: {
  home.file.selemail = {
    enable = true;
    executable = true;
    target = ".dotsbin/selemail";
    text = ''
    #!/usr/bin/env bash

    echo "Select an email to use."
    echo "1. me@cylenia.dev"
    echo "2. callum@purelymail.com"

    read -p "Enter the number of your choice: " choice

    if [ "$choice" -eq 1 ]; then
      neomutt -F ~/.config/mutt/cylenia
    elif [ "$choice" -eq 2 ]; then
      neomutt -F ~/.config/mutt/callum
    else
      echo "Invalid choice"
    fi
    '';
  };
}
