sudo mkdir /run/systemd/system/nix-daemon.service.d/
cat << EOF >/run/systemd/system/nix-daemon.service.d/override.conf
[Service]
Environment="https_proxy=socks5h://127.0.0.1:20170"
EOF
sudo systemctl daemon-reload
sudo systemctl restart nix-daemon
