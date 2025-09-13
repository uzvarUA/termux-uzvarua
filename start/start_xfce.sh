#!/data/data/com.termux/files/usr/bin/bash
# ░▒▓ Termux-X11 XFCE Launcher ▓▒░
# Author: Роббі ✨
# Description: Запускає X11 сервер і XFCE4 сесію з dbus

# 🧠 Перевірка залежностей
for cmd in termux-x11 dbus-launch xfce4-session; do
  command -v "$cmd" >/dev/null 2>&1 || {
    echo "❌ Команда '$cmd' не знайдена. Встанови її перед запуском."
    exit 1
  }
done

# 📦 Запуск X11-серверу
echo "🚀 Запускаю Termux-X11 з XFCE4..."
termux-x11 :1 -xstartup "dbus-launch --exit-with-session xfce4-session" &

# ⏳ Очікування запуску
sleep 2
echo "✅ XFCE4 має запуститися у вікні Termux-X11."

# 📌 Підказка
echo "💡 Порада: переконайся, що Termux:X11 app відкрито і має доступ до дисплею :1"
