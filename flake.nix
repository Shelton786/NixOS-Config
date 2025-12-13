{
  description = "HenryZeng 's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nix-flatpak, ... }@inputs: {
    nixosConfigurations = {
        "ASUS_TianXuan4_Booker786" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; }; # this is the important part
          modules = [
            # base env
            ./device/ASUS_TianXuan4
            ./global/laptop-dev-env

            # extra services
            ./library/services/tailscale

            # desktop env
            ./library/desktop-env/KDE

            # flatpak desktop env
            nix-flatpak.nixosModules.nix-flatpak
            ./library/services/flatpak/desktop-env

            ./library/services/virtualbox
            ./library/services/docker

            # user env
            home-manager.nixosModules.home-manager
            ./library/home-manager
            ./users/laptop/booker786
          ];
      };
    };
  };
}
