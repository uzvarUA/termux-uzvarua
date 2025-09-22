#!/data/data/com.termux/files/usr/bin/bash

# UzvarUA: Ear Relief Reminder 🍵
# Автор: Ро́ббі & Copilot ✨

LOG="$HOME/.ear_relief.log"
BRAND="UzvarUA 🍵 | Ear Relief"

function banner() {
  echo -e "\n🔊 $BRAND"
  echo "─────────────────────────────"
}

function log_action() {
  echo "$(date '+%Y-%m-%d %H:%M') — $1" >> "$LOG"
}

function valsalva() {
  banner
  echo "🌀 Метод Вальсальви:"
  echo "1. Затисни ніс пальцями."
  echo "2. Закрий рот."
  echo "3. Повільно видихай через ніс."
  echo "⚠️ Не дуй надто сильно!"
  log_action "Виконано метод Вальсальви"
}

function toynbee() {
  banner
  echo "🧘 Метод Тойнбі:"
  echo "1. Затисни ніс."
  echo "2. Зроби ковтальний рух (можна з водою)."
  log_action "Виконано метод Тойнбі"
}

function show_log() {
  banner
  echo "📜 Історія дій:"
  cat "$LOG" 2>/dev/null || echo "Поки що порожньо."
}

function menu() {
  banner
  echo "1️⃣ Метод Вальсальви"
  echo "2️⃣ Метод Тойнбі"
  echo "3️⃣ Показати лог"
  echo "4️⃣ Вихід"
  echo -n "🔽 Обери дію: "
  read -r choice
  case "$choice" in
    1) valsalva ;;
    2) toynbee ;;
    3) show_log ;;
    *) echo "👋 До зустрічі!" ; exit ;;
  esac
}

while true; do
  menu
  echo -e "\n🔁 Повернення до меню...\n"
  sleep 2
done
