#!/data/data/com.termux/files/usr/bin/bash

echo "Встановлення ffmpeg"
pkg install ffmpeg -y || { echo "🚨 не встановлено ffmpeg"; exit; }
echo "Готово"
