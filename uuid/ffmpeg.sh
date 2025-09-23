#!/data/data/com.termux/files/usr/bin/bash

# 🌄 UzvarUA — Panorama Cropper for Minecraft Screenshots

# 🔍 Перевірка ffmpeg
command -v ffmpeg >/dev/null 2>&1 || {
  echo "❌ ffmpeg не знайдено. Встанови через: pkg install ffmpeg"
  exit 1
}

echo "📂 Пошук PNG-файлів..."
count=0

for img in *.png; do
  [ -f "$img" ] || continue
  output="panorama_$img"
  echo "🪟 Обрізаю $img → $output"
  ffmpeg -i "$img" -vf "crop=1024:1024:(in_w-1024)/2:(in_h-1024)/2" "$output"
  if [ $? -eq 0 ]; then
    echo "✅ Успішно: $output"
    count=$((count + 1))
  else
    echo "⚠️ Помилка при обробці $img"
  fi
done

echo "🌿 Готово! Обрізано $count зображень до квадрату 1024x1024 і збережено як panorama_*"
