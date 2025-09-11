#!/data/data/com.termux/files/usr/bin/bash

echo "Встановлення ffmpeg"
apt update && apt upgrade -y
apt install ffmpeg -y
echo "Готово"
