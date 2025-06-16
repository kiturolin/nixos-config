{pkgs, ...}:
{
  # 时区
  time.timeZone = "Asia/Shanghai";
  

  i18n.defaultLocale = "zh_CN.UTF-8";
      fonts = {
      # 指定要安装的字体包
      packages = with pkgs; [  
        fira-code
        noto-fonts-cjk-sans    #思源黑体 无衬线
        noto-fonts-cjk-serif   #思源黑体 衬线
        noto-fonts-emoji
        lxgw-wenkai
      ];
      fontconfig = {
        # 启用字体抗锯齿
        antialias = true;
        # 启用字体微调
        hinting.enable = true;
        # 设置系统不同字体类别的默认字体， 比如无衬线默认使用思源宋体无衬线版本
        defaultFonts = {
          emoji = [ "Noto Color Emoji" ];
          monospace = [ "FiraCode Nerd Font" ];
          sansSerif = [ "Noto Sans CJK SC" ];
          serif = [ "Noto Serif CJK SC" ];
        };
      };
  };

  # 输入法有关配置
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      # 指定fcitx5需要安装的默认组件
      addons = [ pkgs.fcitx5-rime ];

      # 针对fcitx5的设置
      settings = {
        globalOptions = {
          "Hotkey/TriggerKeys" = {
            "0" = "Super+Space";
          };
        };
      };
    };
};
}