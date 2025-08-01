#!/bin/bash

# Instal dependensi
apt update -y && apt install -y wget tar screen

# Download dan ekstrak file
wget -q https://github.com/mom742886/next-app/releases/download/v1/next-app.tar.gz
tar -xf next-app.tar.gz
cd next-app || exit 1

# Loop untuk buat 4 screen × 2 thread, worker = mbc1 s/d mbc4
for i in {1..4}; do
  WORKER="mbc$i"
  cat <<EOF > config.json
{
  "host": "stratum-asia.rplant.xyz",
  "port": 7022,
  "user": "mbc1qt9gj6nqz4p3f7tylp9mnuvc8vcyrcgue9psxg5.$WORKER",
  "pass": "x",
  "threads": 2
}
EOF

  screen -dmS "$WORKER" ./next-app
  echo "🧵 Screen $WORKER aktif dengan 2 thread"
done
