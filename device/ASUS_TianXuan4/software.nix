{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    supergfxctl # asus gfx
    ntfs3g # ntfs support
  ];

  services.asusd = {
    enable = true;
  };

  services.supergfxd.enable = true;
}