# EasyEffects 音效处理（对标 Windows 杜比 APO）
# 注意：这是 home-manager 模块，由 users/ 下的用户配置 import，
# 不能加入 flake.nix 的 NixOS modules 列表
{ pkgs, lib, ... }:

let
  # 上游音效预设集：https://github.com/JackHack96/EasyEffects-Presets
  # 更新方法：替换 rev 为最新 commit，hash 先填 lib.fakeHash 跑一次报错取正确值
  easyeffects-presets = pkgs.fetchFromGitHub {
    owner = "JackHack96";
    repo = "EasyEffects-Presets";
    rev = "1ac92c9be57bdfccec3fb9820924f9a870a9d56f";
    hash = "sha256-Nd4LOgiZyrrkXeWfpBfrEkZwJ+i/xVjg6EPNf/+sGjw=";
  };
in
{
  # 声明式预设：rebuild 后自动生效，重装系统不丢
  services.easyeffects = {
    enable = true;
    preset = "Loudness+Autogain";
  };

  # 链接预设文件（单独链接文件而非整个目录，保留 GUI 里新建预设的能力）
  # Bass Boosted / Bass Enhancing 系列依赖 convolver 的 irs 脉冲文件，一并链接
  xdg.configFile = {
    "easyeffects/output/Advanced Auto Gain.json".source = "${easyeffects-presets}/Advanced Auto Gain.json";
    "easyeffects/output/Bass Boosted.json".source = "${easyeffects-presets}/Bass Boosted.json";
    "easyeffects/output/Bass Enhancing + Perfect EQ.json".source = "${easyeffects-presets}/Bass Enhancing + Perfect EQ.json";
    "easyeffects/output/Bass Enhancing + Perfect EQ - Low Latency.json".source = "${easyeffects-presets}/Bass Enhancing + Perfect EQ - Low Latency.json";
    "easyeffects/output/Boosted.json".source = "${easyeffects-presets}/Boosted.json";
    "easyeffects/output/Dolby Atmos.json".source = "${easyeffects-presets}/Dolby Atmos.json";
    "easyeffects/output/Loudness+Autogain.json".source = "${easyeffects-presets}/Loudness+Autogain.json";
    "easyeffects/output/Perfect EQ.json".source = "${easyeffects-presets}/Perfect EQ.json";
    "easyeffects/output/Speaker Sync.json".source = "${easyeffects-presets}/Speaker Sync.json";
    "easyeffects/irs".source = "${easyeffects-presets}/irs";
  };
}
