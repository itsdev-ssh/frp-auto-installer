#!/bin/bash

# Instala FRP Client
FRP_VERSION="0.58.0"
FRP_DIR="frp_${FRP_VERSION}_linux_amd64"
DOWNLOAD_URL="https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/${FRP_DIR}.tar.gz"
VPS_IP="IP-DA-VPS"

echo "[+] Baixando FRP..."
wget -q $DOWNLOAD_URL -O frp.tar.gz

echo "[+] Extraindo arquivos..."
tar -xzf frp.tar.gz
cd $FRP_DIR

echo "[+] Criando configuração frpc.ini..."
cat > frpc.ini <<EOF
[common]
server_addr = $VPS_IP
server_port = 7000

[ssh]
type = tcp
local_ip = 127.0.0.1
local_port = 22
remote_port = 6000
EOF

echo "[+] Iniciando FRP client..."
nohup ./frpc -c frpc.ini > frpc.log 2>&1 &

echo "[+] FRP Client conectado ao servidor $VPS_IP."
