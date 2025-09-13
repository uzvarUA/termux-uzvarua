#!/data/data/com.termux/files/usr/bin/bash

echo "Встановлення"
{ pkg install x11-repo -y; pkg install termux-x11-nightly -y; pkg install xfce4 -y; } || { echo "Не встановлено"; exit }
echo "✅ Готово"
