#!/data/data/com.termux/files/usr/bin/bash

clear
echo "Встановлення оновлення"
termux-change-repo
pkg update -y pkg upgrade -y
echo "Готово"
