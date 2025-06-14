{
  
  hardware.enableRedistributableFirmware = true;

  imports = [
    ./bluetooth.nix
    ./boot.nix
    ./nix.nix
    ./user.nix
    ./networking.nix
    ./disk.nix
  ];

}