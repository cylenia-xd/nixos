{ config, pkgs, ... }: {
  programs.neomutt = {
    enable = true;
    sidebar = {
      enable = true;
      shortPath = true;
      width = 22;
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
    callum = {
      enable = true;
      address = "callum@purelymail.com";
      realName = "Callum";
      passwordCommand = "cat ~/.secrets/emailpw";
      primary = false;
      userName = "callum@purelymail.com";
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
        showDefaultMailbox = false;
      };
    };
  };
}
