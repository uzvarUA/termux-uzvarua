#!/data/data/com.termux/files/usr/bin/bash

echo -e "\033[1;34m🚀 Починаємо встановлення...\033[0m"
{ pkg install x11-repo -y; pkg install termux-x11-nightly -y; pkg install xfce4 -y; } || { echo "Не встановлено"; exit }
echo "✅ Готово"
