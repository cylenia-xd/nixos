{ config, ... }: {
  sops.secrets.email_password.owner = "cylenia";
  hm.programs.neomutt = {
    enable = true;
    sidebar.enable = false;
    extraConfig = ''
      color normal		          default default
      color index		            color2 default ~N
      color index		            color1 default ~F
      color index		            color13 default ~T
      color index		            color1 default ~D
      color attachment	        color5 default
      color signature	          color8 default
      color search		          color4 default
      color indicator		        default color8
      color error		            color1 default
      color status		          color15 default
      color tree                color15 default
      color tilde               color15 default
      color hdrdefault          color13 default
      color header		          color13 default "^From:"
      color header	 	          color13 default "^Subject:"
      color quoted		          color15 default
      color quoted1		          color7 default
      color quoted2		          color8 default
      color quoted3		          color0 default
      color quoted4		          color0 default
      color quoted5		          color0 default
      color body		            color2 default		[\-\.+_a-zA-Z0-9]+@[\-\.a-zA-Z0-9]+
      color body	              color2 default		(https?|ftp)://[\-\.,/%~_:?&=\#a-zA-Z0-9]+
      color body		            color4 default		(^|[[:space:]])\\*[^[:space:]]+\\*([[:space:]]|$)
      color body		            color4 default		(^|[[:space:]])_[^[:space:]]+_([[:space:]]|$)
      color body		            color4 default		(^|[[:space:]])/[^[:space:]]+/([[:space:]]|$)
      color sidebar_flagged     color1 default
      color sidebar_new         color10 default
    '';
  };

  hm.accounts.email.accounts = {
    cylenia = {
      enable = true;
      address = "me@cylenia.dev";
      realName = "Cylenia";
      passwordCommand = "cat ${config.sops.secrets.email_password.path}";
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

  hm.home.file.mailcap = {
    enable = true;
    executable = true;
    force = true;
    target = ".mailcap";
    text = "text/html; firefox %s; nametemplate=%s.html";
  };
}
