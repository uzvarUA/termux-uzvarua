#!/data/data/com.termux/files/usr/bin/bash

# 📁 Робоча директорія
WORKDIR="$HOME/termux-uzvarua/asciinema"
LOGFILE="$HOME/termux-uzvarua/asciinema_build.log"

# 🧹 Очистка попередньої спроби
rm -rf "$WORKDIR"
mkdir -p "$(dirname "$LOGFILE")"
echo "🧹 Очищено стару директорію" | tee "$LOGFILE"

# 🌀 Клонування репозиторію
echo "📥 Клоную asciinema з GitHub..."
git clone https://github.com/asciinema/asciinema "$WORKDIR" >> "$LOGFILE" 2>&1

# 📂 Перехід у директорію
cd "$WORKDIR" || { echo "❌ Не вдалося перейти в $WORKDIR"; exit 1; }

# 🛠️ Компіляція
echo "🔧 Компілюю з cargo..."
cargo build --release >> "$LOGFILE" 2>&1

# ✅ Перевірка результату
if [[ -f "$WORKDIR/target/release/asciinema" ]]; then
    echo "✅ Успішно зібрано! Бінарник: $WORKDIR/target/release/asciinema"
else
    echo "❌ Помилка компіляції. Перевір лог: $LOGFILE"
fi
