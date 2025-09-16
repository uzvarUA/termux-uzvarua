
#!/data/data/com.termux/files/usr/bin/bash

# 🎬 UzvarUA: Встановлення asciinema через proot -0
# Автор: Роббі & Copilot ✨

LOG="$HOME/.asciinema_install.log"
PKG="asciinema"

echo "🔧 Запуск через proot -0..." | tee -a "$LOG"

proot -0 bash -c "
  echo '📦 Оновлення списку пакетів...' && \
  apt update -y && \
  echo '📥 Встановлення $PKG...' && \
  apt install $PKG -y
" >> "$LOG" 2>&1

if command -v asciinema >/dev/null 2>&1; then
  echo "✅ $PKG успішно встановлено! Версія: $(asciinema --version)" | tee -a "$LOG"
else
  echo "⚠️ Встановлення не вдалося. Перевір лог: $LOG" | tee -a "$LOG"
fi
