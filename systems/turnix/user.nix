{ config, ... }:
{
  programs.fish.enable = true;
  users.users.kituro = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
    ];
    shell = config.programs.fish.package;
    password = "123456";
  };

  nix.settings.trusted-users = [ "kituro" ];
}
