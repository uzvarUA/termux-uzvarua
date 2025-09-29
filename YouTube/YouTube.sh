#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail
# UzvarUA: Німе кіно з YouTube 🎬

clear
echo -e "\n🎬 \e[1mUzvarUA Silent Cinema\e[0m — перетвори будь-яке відео на ретро-шедевр\n"

command -v yt-dlp >/dev/null || {
  echo "⚠️ yt-dlp не знайдено. Встанови його через: pip install yt-dlp"
  exit 1
}

command -v ffmpeg >/dev/null 2>&1 || {
  echo "❌ ffmpeg не знайдено. Встанови його через: pkg install ffmpeg"
  exit 1
}

# 🔹 Введення URL
read -p "🔗 Встав URL відео з YouTube: " URL || {
  echo "Не вдалося прочитати"
  exit 1
}

[[ -z "$URL" ]] && {
  echo "❌ URL не може бути порожнім."
  exit 1
}

# 🔹 Завантаження відео
echo -e "\n⬇️ Завантажую відео..."
yt-dlp -f bestvideo+bestaudio --merge-output-format mp4 -o "input.mp4" "$URL" || {
  echo "Не вдалося завантажити"
  exit 1
}

# 🔹 Стилізація під німе кіно
echo -e "\n🎞️ Стилізую відео у стилі 1920-х..."
ffmpeg -i input.mp4 \
-vf "format=gray, fps=16, noise=alls=20:allf=t+u, eq=contrast=1.5:brightness=0.05, vignette" \
-an silent_film.mp4

# 🔹 Вибір музики
echo -e "\n🎼 Обери музичний супровід:"
echo "1) Glass Chinchilla — The Mini Vandals"
echo "2) Без музики"
read -p "🎵 Введи номер: " MUSIC

if [[ "$MUSIC" == "1" ]]; then
    # 🔹 Перевірка наявності треку
    if [[ ! -f "glass_chinchilla.mp3" ]]; then
        echo -e "\n⚠️ Файл 'glass_chinchilla.mp3' не знайдено. Завантаж його вручну."
        exit 1
    fi
    echo -e "\n🎹 Додаю музичний супровід..."
    ffmpeg -i silent_film.mp4 -i glass_chinchilla.mp3 -c:v copy -c:a aac -shortest silent_with_music.mp4
    echo -e "\n✅ Готово: \e[1msilent_with_music.mp4\e[0m"
else
    echo -e "\n✅ Готово: \e[1msilent_film.mp4\e[0m"
fi

# 🔚 Завершення
echo -e "\n🍵 Дякую за творчість! UzvarUA вітає тебе у світі німого кіно.\n"
