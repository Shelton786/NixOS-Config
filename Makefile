update:
	nix flake update
ASUS_TianXuan4_Booker786:
	http_proxy=http://127.0.0.1:20171 https_proxy=http://127.0.0.1:20171 nixos-rebuild build --flake ./#ASUS_TianXuan4_Booker786 --show-trace --option substituters https://cache.nixos.org/
	sudo nixos-rebuild switch --flake ./#ASUS_TianXuan4_Booker786
	rm result
eval-time:
	time nix eval --raw .#nixosConfigurations.ASUS_TianXuan4_Booker786.config.system.build.toplevel --show-trace

enable-proxy:
	sudo sh ./proxy.sh