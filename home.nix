{ config, pkgs, ... }:

{
  # 注意修改这里的用户名与用户目录
  home.username = "kituro";
  home.homeDirectory = "/home/kituro";


  # 设置鼠标指针大小以及字体 DPI（适用于 4K 显示器）
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  home.packages = with pkgs;[
    just
    cherry-studio
    qq
    wechat-uos
    kdePackages.okular
    libreoffice-qt6
    snipaste
    obsidian
    direnv
  ];

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "epyc1" = {
        hostname = "10.15.89.111";
        user = "kiturolin";
      };
      "epyc2" = {
        hostname = "10.15.89.112";
        user = "kiturolin";
      };
    };

  };

  # 使用neovim做默认编辑器
  programs.neovim.defaultEditor = true;

  # git 相关配置
  programs.git = {
    enable = true;
    userName = "kiturolin";
    userEmail = "linkzh2024@shanghaitech.edu.cn";
  };


  # alacritty - 一个跨平台终端，带 GPU 加速功能
  programs.alacritty = {
    enable = true;
    # 自定义配置
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
        draw_bold_text_with_bright_colors = true;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {};
  };

  home.stateVersion = "25.05";
}
