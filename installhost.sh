#!/bin/bash

# Instala FRP Server (frps) na VPS AWS
FRP_VERSION="0.58.0"
FRP_DIR="frp_${FRP_VERSION}_linux_amd64"
DOWNLOAD_URL="https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/${FRP_DIR}.tar.gz"

echo "[+] Baixando FRP..."
wget -q $DOWNLOAD_URL -O frp.tar.gz

echo "[+] Extraindo arquivos..."
tar -xzf frp.tar.gz
cd $FRP_DIR

echo "[+] Criando configuração frps.ini..."
cat > frps.ini <<EOF
[common]
bind_port = 7000
EOF

echo "[+] Iniciando FRP server..."
nohup ./frps -c frps.ini > frps.log 2>&1 &

echo "[+] FRP Server iniciado na porta 7000."