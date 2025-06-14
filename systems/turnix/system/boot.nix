{
  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usbhid" "usb_storage" "sd_mod" "sdhci_pci" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" "i2c_hid" "intel_ishtp" "intel_ish_ipc" ];
  boot.extraModulePackages = [ ];

  boot.initrd.systemd.enable = true;

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = true;
      editor = false;
      configurationLimit = 3;
    };
  };
}
