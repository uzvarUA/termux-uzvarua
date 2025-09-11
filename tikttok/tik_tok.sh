#!/data/data/com.termux/files/usr/bin/bash

# === УНІКАЛІЗАТОР ДЛЯ TIKTOK ===
# Автор: Роббі & Copilot 🦄
# Опис: Завантаження + ffmpeg-унікалізація відео (дзеркало + фільтри)

# === ВВЕДЕННЯ URL ===
read -p "🔗 Встав TikTok-посилання для завантаження: " URL
[[ -z "$URL" ]] && echo "⚠️ URL не знайдено. Вихід." && exit 0

# === НАЛАШТУВАННЯ ===
OUTDIR="$HOME/tiktok_uniqs"
mkdir -p "$OUTDIR"

# === ПЕРЕВІРКА ІНСТРУМЕНТІВ ===
for tool in yt-dlp ffmpeg; do
  command -v $tool >/dev/null 2>&1 || {
    echo "❌ Встанови $tool: pkg install $tool"
    exit 1
  }
done

# === ЗАВАНТАЖЕННЯ ВІДЕО ===
echo "📥 Завантаження з TikTok..."
yt-dlp -f mp4 "$URL" -o "$OUTDIR/input.%(ext)s" || exit 1

INPUT="$OUTDIR/input.mp4"
OUTPUT="$OUTDIR/uniq_$(date +%s).mp4"

# === УНІКАЛІЗАЦІЯ ===
echo "🎨 Обробка відео (дзеркало + фільтри)..."
ffmpeg -i "$INPUT" \
  -vf "hflip, \
       eq=brightness=0.05:saturation=1.2, \
       scale=720:-2, \
       drawbox=x=0:y=0:w=iw:h=50:color=black@0.5:t=fill, \
       drawtext=text='@uzvar_ua':fontcolor=white:fontsize=24:x=10:y=10" \
  -c:a copy "$OUTPUT"

# === ЗВІТ ===
echo "✅ Унікалізоване відео збережено: $OUTPUT"
