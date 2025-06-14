{ pkgs, ... }:
{
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = 1;

  i18n.defaultLocale = "zh_CN.UTF-8";
     fonts = {
     packages = with pkgs; [
       fira-code-nerdfont
       noto-fonts-cjk-sans
       noto-fonts-cjk-serif
       noto-fonts-emoji
     ];
     fontconfig = {
       antialias = true;
       hinting.enable = true;
       defaultFonts = {
         emoji = [ "Noto Color Emoji" ];
         monospace = [ "FiraCode Nerd Font" ];
         sansSerif = [ "Noto Sans CJK SC" ];
         serif = [ "Noto Serif CJK SC" ];
       };
     };
   };
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = [ pkgs.fcitx5-rime ];
      settings = {
        globalOptions = {
          "Hotkey/TriggerKeys" = {
            "0" = "Control+Shift+Shift_L";
          };
        };
      };
    };
  };

}
