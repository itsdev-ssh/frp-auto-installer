# Instalação Automática do FRP (Fast Reverse Proxy)

Este repositório contém os arquivos e scripts necessários para configurar automaticamente o **FRP** em sua VPS, permitindo expor serviços locais à internet com suporte a **TCP** e **UDP**, utilizando um **IP fixo** diretamente da VPS hospedeira.

---

## O que é o FRP?

O **Fast Reverse Proxy (FRP)** é uma ferramenta que permite abrir portas de uma máquina local para a internet através de uma VPS. É ideal para:

- Acesso remoto a servidores locais
- Túnel para aplicativos em desenvolvimento
- Jogos e serviços que exigem IP fixo
- Exposição de servidores web ou painéis locais

---

## ⚙️ Funcionalidades

- Suporte a conexões **TCP e UDP**
- Exposição de **qualquer porta local**
- Uso de **IP fixo da VPS**
- Instalação rápida e automatizada

---

## 📦 Instalação na VPS

### 1. Clone este repositório

```bash
git clone https://github.com/itsdev-ssh/frp-auto-installer
cd frp-auto-installer
```
### 2. Torne o instalador executável
```bash
chmod +x installhost.sh
```

### 3. Execute o script de instalação
```bash
./installclient.sh
```
---

## 📦 Instalação na Máquina/servidor local
### 1. Clone este repositório

```bash
git clone https://github.com/itsdev-ssh/frp-auto-installer
cd frp-auto-installer
```
### 2. Torne o instalador executável
```bash
chmod +x installclient.sh
```
### 3. Modifique o script
```bash
nano installclient.sh
```
Modifique a parte de ```VPS_IP="IP-DA-VPS"``` Coloque o IP real de sua VPS.
### 4. Execute o script de inicialização
```bash
./installclient.sh
```
Pronto, seu servidor local estará com IP Fixo e público.

---

## Como abrir porta UDP e TCP
No seu servidor local, abra o arquivo de configuração:
```bash
nano ~/frp/frpc.ini
```
Agora adicione blocos como este para cada serviço que quiser expor:

Exemplo: Liberar porta 25565 TCP (Minecraft Java)
```bash
[minecraft]
type = tcp
local_ip = 127.0.0.1
local_port = 25565
remote_port = 25565
```
Exemplo: Liberar porta 19132 UDP (Minecraft Bedrock)
```bash
[minecraft_bedrock]
type = udp
local_ip = 127.0.0.1
local_port = 19132
remote_port = 19132
```
Exemplo: Liberar HTTP (porta 80)
```bash
[web]
type = tcp
local_ip = 127.0.0.1
local_port = 80
remote_port = 8080
```
