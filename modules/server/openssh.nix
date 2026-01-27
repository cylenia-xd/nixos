{  ... }: {
  services.openssh = {
    enable = true;
    authorizedKeysInHomedir = false;
  };

  users.users.cylenia.openssh.authorizedKeys.keys =
    [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE1XHWN+HMREOhta8Ltz9GpmqldZVDToXLi4kIftvk0B me@cylenia.dev" ];

  users.users.root.openssh.authorizedKeys.keys =
    [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE1XHWN+HMREOhta8Ltz9GpmqldZVDToXLi4kIftvk0B me@cylenia.dev" ];
}
