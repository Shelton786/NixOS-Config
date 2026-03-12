{ config, pkgs, ... }:

{
  # 启用 CUPS 打印服务
  services.printing.enable = true;

  # 启用 Avahi 用于网络打印机发现
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
  
  # IPP over USB（USB 打印机扫描必需）
  services.ipp-usb.enable = true;

  # 打印机相关软件包
  environment.systemPackages = with pkgs; [
    cups
    cups-filters
    gutenprint
    sane-airscan  # 如果打印机支持扫描功能
    simple-scan      # 图形扫描
    system-config-printer # 如果需要KDE图形界面配置打印机
  ];

  # 开放打印机端口
  networking.firewall.allowedTCPPorts = [ 631 ];

  # 可选：声明式添加打印机（如果 IP 固定）
  # services.printing.printers = {
  #   xiaomi-mijia = {
  #     uri = "ipp://192.168.1.50/ipp/print";
  #     model = "driverless:urf";  # AirPrint/IPP Everywhere
  #     description = "Xiaomi Mijia Inkjet Printer";
  #     location = "Living Room";
  #   };
  # };

  # 可选：将用户加入 lpadmin 组，免 sudo 管理打印机
  # users.users.booker786.extraGroups = [ "lp" "lpadmin" ];
}