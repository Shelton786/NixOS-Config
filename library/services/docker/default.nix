{
  virtualisation.docker.enable = true;
  users.users.booker786.extraGroups = [ "docker" ];
  virtualisation.docker.storageDriver = "btrfs";
}