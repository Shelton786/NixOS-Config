{
  # 这是 Home Manager 的用户级选项
  programs.kdeconnect = {
    enable = true;
  };
  
  # 允许 KDE Connect 通过防火墙
  networking.firewall = {
    allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
    allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];
  };
}