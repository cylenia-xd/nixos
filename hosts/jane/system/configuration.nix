{ lib, pkgs, ... }: {
  imports = [
    ./hardware.nix
    ./modules/greetd.nix
    ./modules/gpg.nix
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

  sops.defaultSopsFile = ../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.keyFile = "/home/cylenia/.config/sops/age/keys.txt";
  sops.secrets = {};

  networking.hostName = "jane";
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;
  networking.nameservers = [
    "9.9.9.9"
    "149.112.112.112"
    "2620:fe::fe"
    "2620:fe::9"
  ];

  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    xwayland-satellite
  ];

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

  programs.niri.enable = true;
  services.gnome.gnome-keyring.enable = true;

  qt = {
    enable = true;
    style = "adwaita-dark";
    platformTheme = "gnome";
  };

  xdg.portal = {
    enable = lib.mkDefault true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      common.default = "gnome";
      niri.default = lib.mkForce "gnome";
      obs.default = "gnome";
    };
  };

  hardware.bluetooth.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.systemd.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.plymouth = {
    enable = true;
    theme = "bgrt";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "olm-3.2.16"
  ];
  
  # don't change this!
  system.stateVersion = "25.11";
}
