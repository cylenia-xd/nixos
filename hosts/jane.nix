{ lib, config, modulesPath, inputs, ... }: {
  imports = [
    (lib.mkAliasOptionModule [ "hm" ] [ "home-manager" "users" "cylenia" ])
    (modulesPath + "/installer/scan/not-detected.nix")
    "${inputs.self}/modules/desktop"
    "${inputs.self}/modules/common"
  ];

  networking.hostName = "jane";
  hardware.bluetooth.enable = true;

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "sd_mod" ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.initrd.luks.devices."cryptroot".device = "/dev/disk/by-uuid/972eaff6-d37b-45fe-87c9-7afd63e55e12";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  fileSystems."/" = {
    device = "/dev/mapper/cryptroot";
    fsType = "btrfs";
    options = [ "subvol=@" ];
  };

  fileSystems."/home" = {
    device = "/dev/mapper/cryptroot";
    fsType = "btrfs";
    options = [ "subvol=@home" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/D9E8-4BCD";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  # don't change this!
  system.stateVersion = "25.11";
  hm.home.stateVersion = "25.11";
}
