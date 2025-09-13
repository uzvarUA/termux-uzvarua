#!/data/data/com.termux/files/usr/bin/bash

# 🎨 Стильний лог
echo -e "\e[1;36m[•] Створення запуску Termux-X11 з XFCE4...\e[0m"

# 🔍 Перевірка наявності termux-x11
command -v termux-x11 >/dev/null 2>&1 || {
  echo -e "\e[1;31m[!] termux-x11 не знайдено. Встанови його з GitHub або pkg install.\e[0m"
  exit 1
}

# 📁 Створення скрипту запуску
LAUNCHER="$PREFIX/bin/start-termux-x11"
echo 'termux-x11 :1 -xstartup "xfce4-session"' > "$LAUNCHER"
chmod +x "$LAUNCHER"

# ✅ Підтвердження
echo -e "\e[1;32m[✓] Скрипт $LAUNCHER створено та зроблено виконуваним.\e[0m"
echo -e "\e[1;33m[→] Тепер можеш запускати XFCE через: start-termux-x11\e[0m"
