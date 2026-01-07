{ config, pkgs, ... }: {
  programs.neomutt = {
    enable = true;
    sidebar.enable = false;
    settings = {
      color = {
        normal = {
          fg = "default";
          bg = "default";
        };

        indexNew = {
          fg = "color2";
          bg = "default";
          pattern = "~N";
        };

        indexFlagged = {
          fg = "color1";
          bg = "default";
          pattern = "~F";
        };

        indexTagged = {
          fg = "color13";
          bg = "default";
          pattern = "~T";
        };

        indexDeleted = {
          fg = "color1";
          bg = "default";
          pattern = "~D";
        };

        attachment = {
          fg = "color5";
          bg = "default";
        };

        signature = {
          fg = "color8";
          bg = "default";
        };

        search = {
          fg = "color4";
          bg = "default";
        };

        indicator = {
          fg = "default";
          bg = "color8";
        };

        error = {
          fg = "color1";
          bg = "default";
        };

        status = {
          fg = "color15";
          bg = "default";
        };

        tree = {
          fg = "color15";
          bg = "default";
        };

        tilde = {
          fg = "color15";
          bg = "default";
        };

        hdrdefault = {
          fg = "color13";
          bg = "default";
        };

        headerFrom = {
          fg = "color13";
          bg = "default";
          pattern = "^From:";
        };

        headerSubject = {
          fg = "color13";
          bg = "default";
          pattern = "^Subject:";
        };

        quoted = {
          fg = "color15";
          bg = "default";
        };

        quoted1 = {
          fg = "color7";
          bg = "default";
        };

        quoted2 = {
          fg = "color8";
          bg = "default";
        };

        quoted3 = {
          fg = "color0";
          bg = "default";
        };

        quoted4 = {
          fg = "color0";
          bg = "default";
        };

        quoted5 = {
          fg = "color0";
          bg = "default";
        };

        bodyEmail = {
          fg = "color2";
          bg = "default";
          pattern = ''[\-\.+_a-zA-Z0-9]+@[\-\.a-zA-Z0-9]+'';
        };

        bodyUrl = {
          fg = "color2";
          bg = "default";
          pattern = ''(https?|ftp)://[\-\.,/%~_:?&=\#a-zA-Z0-9]+'';
        };

        bodyBold = {
          fg = "color4";
          bg = "default";
          pattern = ''(^|[[:space:]])\*[^[:space:]]+\*([[:space:]]|$)'';
        };

        bodyUnderline = {
          fg = "color4";
          bg = "default";
          pattern = ''(^|[[:space:]])_[^[:space:]]+_([[:space:]]|$)'';
        };

        bodyItalic = {
          fg = "color4";
          bg = "default";
          pattern = ''(^|[[:space:]])/[^[:space:]]+/([[:space:]]|$)'';
        };

        sidebarFlagged = {
          fg = "color1";
          bg = "default";
        };

        sidebarNew = {
          fg = "color10";
          bg = "default";
        };
      };
    };
  };

  accounts.email.accounts = {
    cylenia = {
      enable = true;
      address = "me@cylenia.dev";
      realName = "Cylenia";
      passwordCommand = "cat ~/.secrets/emailpw";
      primary = true;
      userName = "me@cylenia.dev";
      smtp = {
        authentication = "login";
        host = "smtp.purelymail.com";
        port = 465;
        tls.enable = true;
      };
      imap = {
        authentication = "login";
        host = "imap.purelymail.com";
        port = 993;
        tls.enable = true;
      };
      neomutt = {
        enable = true;
        mailboxType = "imap";
        showDefaultMailbox = true;
      };
    };
  };
}
