{ lib, config, pkgs, modulesPath, inputs, ... }: {
  imports = [
    (lib.mkAliasOptionModule [ "hm" ] [ "home-manager" "users" "cylenia" ])
    (modulesPath + "/installer/scan/not-detected.nix")
    "${inputs.self}/modules/desktop"
    "${inputs.self}/modules/common"
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

  networking.wireguard.enable = true;
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

  services.upower.enable = true;

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

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/mapper/luks-972eaff6-d37b-45fe-87c9-7afd63e55e12";
    fsType = "btrfs";
    options = [ "subvol=@" ];
  };

  boot.initrd.luks.devices."luks-972eaff6-d37b-45fe-87c9-7afd63e55e12".device = "/dev/disk/by-uuid/972eaff6-d37b-45fe-87c9-7afd63e55e12";

  fileSystems."/home" = {
    device = "/dev/mapper/luks-972eaff6-d37b-45fe-87c9-7afd63e55e12";
    fsType = "btrfs";
    options = [ "subvol=@home" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/D9E8-4BCD";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  swapDevices = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  
  # don't change this!
  system.stateVersion = "25.11";
  hm.home.stateVersion = "25.11";
}
