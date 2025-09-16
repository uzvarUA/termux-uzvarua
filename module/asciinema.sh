#!/data/data/com.termux/files/usr/bin/bash

# 🎬 UzvarUA: Встановлення asciinema без proot
# Автор: Роббі & Copilot ✨

LOG="$HOME/.asciinema_install.log"
PKG="asciinema"

echo "📦 Оновлення списку пакетів..." | tee -a "$LOG"
apt update -y >> "$LOG" 2>&1

echo "📥 Встановлення $PKG..." | tee -a "$LOG"
apt install $PKG -y >> "$LOG" 2>&1

if command -v asciinema >/dev/null 2>&1; then
  echo "✅ $PKG успішно встановлено! Версія: $(asciinema --version)" | tee -a "$LOG"
else
  echo "⚠️ Встановлення не вдалося. Перевір лог: $LOG" | tee -a "$LOG"
fi
