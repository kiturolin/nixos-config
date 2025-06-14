{config, pkgs, ... }:
{
  # 启用neovim
  programs.neovim.enable = true;
  programs.clash-verge.tunMode = true;
  programs.clash-verge.serviceMode = true;
  programs.clash-verge.enable = true;
  
  # 系统级软件包
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
}