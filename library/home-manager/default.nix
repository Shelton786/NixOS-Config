# home-mamager plugin config

{ home-manager, inputs, ... }:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = inputs;
  #遇到冲突文件时，自动将旧文件重命名为 .backup
  home-manager.backupFileExtension = "backup";
}