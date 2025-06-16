{
  # 启用那些根据其许可证允许重新分发的固件，解决固件问题
  hardware.enableRedistributableFirmware = true;

  imports = [
    ./bluetooth.nix
    ./boot.nix
    ./nix.nix
    ./user.nix
    ./networking.nix
    ./disk.nix
    ./mccgdi
  ];

}
