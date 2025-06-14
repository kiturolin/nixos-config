{config, pkgs, ... }:

{
  system.stateVersion = "25.11";
  networking.hostName = "turnix";
  nixpkgs.hostPlatform = "x86_64-linux";
  time.timeZone = "Asia/Shanghai";
  hardware.enableRedistributableFirmware = true;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
  services.pipewire.pulse.enable = true;

  #TODO: temp
  programs.neovim.enable = true;
  programs.clash-verge.tunMode = true;
  programs.clash-verge.serviceMode = true;
  programs.clash-verge.enable = true;
  
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    wget
    firefox
    btop
    git
    fastfetch
    vscode
    thunderbird
    rar
  ];

  imports = [
    ./boot.nix
    ./nix.nix
    ./user.nix
    ./desktop.nix
    ./networking.nix
    ./disk.nix
  ];
}
