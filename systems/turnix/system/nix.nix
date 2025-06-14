{
  system.stateVersion = "25.11";
  nixpkgs.hostPlatform = "x86_64-linux";
  
  nix = {
    channel.enable = false;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}