{ config, pkgs, ... }:

let
  goodixGt7868qModule = config.boot.kernelPackages.callPackage ./goodix-gt7868q.nix { };
in
{
  boot.kernelModules = [ "goodix-gt7868q" ];
  boot.extraModulePackages = [ goodixGt7868qModule ];
  # environment.systemPackages = [ goodixGt7868qModule ];
  environment.etc."libinput/local-overrides.quirks".source = "${goodixGt7868qModule}/etc/libinput/60-custom-thinkbookg6p2024imh.quirks"; 
  imports = [
    ./system
    ./desktop
  ];
}
