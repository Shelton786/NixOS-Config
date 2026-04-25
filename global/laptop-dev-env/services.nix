{ pkgs, ... }:
{
  #services.v2raya.enable = true;
  
  # 添加 v2rayn
  environment.systemPackages = with pkgs; [
    v2rayn
    # 建议同时保留 networkmanager，v2rayN 依赖它来管理系统代理
    #networkmanager 
  ];

  # 确保开启了 polkit，否则 v2rayN 申请管理员权限设置系统代理时会报错
  security.polkit.enable = true;

}