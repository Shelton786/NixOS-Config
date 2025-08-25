{
  virtualisation.docker.enable = true;
  users.users.booker786.extraGroups = [ "docker" ];
  virtualisation.docker.storageDriver = "btrfs";
  virtualisation.docker.daemon.settings = {
    proxies = {
      http-proxy = "http://127.0.0.1:20171";
      https-proxy = "http://127.0.0.1:20171";
      no-proxy = "*.test.example.com,.example.org,127.0.0.0/8";
    };
  };
}
