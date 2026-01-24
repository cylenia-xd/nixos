{ pkgs, inputs, ... }: {
  imports = [
    ./hardware.nix
    "${inputs.self}/modules/n/newt.nix"
    "${inputs.self}/modules/n/sshd.nix"
    "${inputs.self}/modules/n/gpg.nix"
    "${inputs.self}/modules/n/caddy.nix"
    "${inputs.self}/modules/n/vaultwarden.nix"
    "${inputs.self}/modules/n/sops.nix"
    "${inputs.self}/modules/n/immich.nix"
  ];

  users = {
    mutableUsers = false;
    users.cylenia = {
      isNormalUser = true;
      description = "Cylenia";
      shell = pkgs.bash;
      extraGroups = [ "networkmanager" "wheel" ];
      hashedPassword = "$y$j9T$gej56YvgGE.K/x4UOF/mZ1$W7EQoyuqICLE8uV1oIxM.cI180PXT9xERVXMzDdtAV0";
    };
    users.root = {
      hashedPassword = "$y$j9T$gej56YvgGE.K/x4UOF/mZ1$W7EQoyuqICLE8uV1oIxM.cI180PXT9xERVXMzDdtAV0";
    };
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.network.ssh.enable = true;

  networking.hostName = "paul";
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  time.timeZone = "Australia/Melbourne";
  console.keyMap = "uk";
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # don't change this!
  system.stateVersion = "25.11";
}
