{ lib, config,  modulesPath, inputs, ... }: {
  imports = [
    (lib.mkAliasOptionModule [ "hm" ] [ "home-manager" "users" "cylenia" ])
    (modulesPath + "/installer/scan/not-detected.nix")
    "${inputs.self}/modules/server"
    "${inputs.self}/modules/common"
  ];

  networking.hostName = "paul";

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  swapDevices = [ { device = "/dev/disk/by-uuid/ffabe7e5-a2a7-45e8-9cf6-06cb3af68043"; } ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/1f4badfc-b9d0-4691-8130-326e01821661";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/3133-B330";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  # don't change this!
  system.stateVersion = "25.11";
  hm.home.stateVersion = "25.11";
}
