#!/data/data/com.termux/files/usr/bin/bash

echo -e "\033[1;34m🚀 Починаємо встановлення...\033[0m"

if pkg install x11-repo -y && \
   pkg install termux-x11-nightly -y && \
   pkg install xfce4 -y; then
  echo -e "\033[1;32m✅ Готово!\033[0m"
else
  echo -e "\033[1;31m❌ Не вдалося встановити пакети.\033[0m"
  exit 1
fi
