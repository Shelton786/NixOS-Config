{ lib, ... }:
{
  imports = [
    ../support.nix
  ];

  services.flatpak.packages = [
    "org.telegram.desktop"
    "com.microsoft.Edge"
    "com.qq.QQ"
    "com.tencent.WeChat"
    "com.tencent.wemeet"
  ];
}
