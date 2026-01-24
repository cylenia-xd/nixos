{ lib, config, pkgs, modulesPath, inputs, ... }: {
  imports = [
     (lib.mkAliasOptionModule [ "hm" ] [ "home-manager" "users" "cylenia" ])
     (modulesPath + "/installer/scan/not-detected.nix")
    "${inputs.self}/modules/newt.nix"
    "${inputs.self}/modules/sshd.nix"
    "${inputs.self}/modules/gpg.nix"
    "${inputs.self}/modules/caddy.nix"
    "${inputs.self}/modules/vaultwarden.nix"
    "${inputs.self}/modules/sops.nix"
    "${inputs.self}/modules/immich.nix"
    "${inputs.self}/modules/shell.nix"
    "${inputs.self}/modules/editor"
    "${inputs.self}/modules/tools"
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

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/1f4badfc-b9d0-4691-8130-326e01821661";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/3133-B330";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/ffabe7e5-a2a7-45e8-9cf6-06cb3af68043"; }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # don't change this!
  system.stateVersion = "25.11";
  hm.home.stateVersion = "25.11";
}
