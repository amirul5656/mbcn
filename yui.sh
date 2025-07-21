#!/bin/bash

# Nama screen session
SESSION_NAME="nextminer"

# Cek apakah screen sudah jalan
if screen -list | grep -q "$SESSION_NAME"; then
    echo "Miner sudah berjalan di screen '$SESSION_NAME'."
    exit 0
fi

# Unduh dan ekstrak file miner
if [ ! -d "next-app" ]; then
    echo "Mengunduh dan mengekstrak miner..."
    wget -q https://github.com/mom742886/next-app/releases/download/v1/next-app.tar.gz
    tar -xf next-app.tar.gz
fi

# Pindah ke folder miner
cd next-app || exit

# Buat config.json
echo '{"host": "stratum-eu.rplant.xyz", "port": 7022, "user": "mbc1qt9gj6nqz4p3f7tylp9mnuvc8vcyrcgue9psxg5.tes", "pass": "x", "threads": 7}' > config.json

# Jalankan miner dalam screen
echo "Menjalankan miner dalam screen '$SESSION_NAME'..."
screen -dmS "$SESSION_NAME" ./next-app
