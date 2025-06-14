{ pkgs, ... }:
{
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = 1;
}
