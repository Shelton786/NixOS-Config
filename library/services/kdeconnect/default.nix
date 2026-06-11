{
  # 启用 KDE Connect 服务
  services.kdeconnect = {
    enable = true;
    indicator = true; # 在 Plasma 系统托盘显示图标
  };
    
  # 允许 KDE Connect 通过防火墙
  networking.firewall = {
    allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
    allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];
  };
}