sudo mkdir /run/systemd/system/nix-daemon.service.d/
cat << EOF >/run/systemd/system/nix-daemon.service.d/override.conf  
[Service]
Environment="https_proxy=http://127.0.0.1:20171"
Environment="http_proxy=http://127.0.0.1:20171"
EOF
sudo systemctl daemon-reload
sudo systemctl restart nix-daemon