{
  # NixOS 会尽量保持旧版本的行为，以避免意外的破坏性更改。
  system.stateVersion = "25.11";
  nixpkgs.hostPlatform = "x86_64-linux";
  
  nix = {
    # 禁用频道，使用Flakes
    channel.enable = false;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}