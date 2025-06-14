{
  system.stateVersion = "25.11";
  nixpkgs.hostPlatform = "x86_64-linux";
  hardware.enableRedistributableFirmware = true;

  imports = [
    ./bluetooth.nix
    ./boot.nix
    ./nix.nix
    ./user.nix
    ./networking.nix
    ./disk.nix
  ]

}