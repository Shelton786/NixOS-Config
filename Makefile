update:
	nix flake update
ASUS_TianXuan4_Booker786:
	sudo nixos-rebuild switch --flake ./#ASUS_TianXuan4_Booker786

eval-time:
	time nix eval --raw .#nixosConfigurations.ASUS_TianXuan4_Booker786.config.system.build.toplevel --show-trace

enable-proxy:
	sudo sh ./proxy.sh