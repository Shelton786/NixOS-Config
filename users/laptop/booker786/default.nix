{
  users.users.booker786 = {
    isNormalUser = true;
    extraGroups = ["wheel" "vboxusers" "docker"]; # Enable ‘sudo’ for the user.
  };
  home-manager.users.booker786 = import ./booker786.nix;
}
