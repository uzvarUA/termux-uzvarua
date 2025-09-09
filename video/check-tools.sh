#!/data/data/com.termux/files/usr/bin/bash

# 🎨 ASCII-банер
clear
echo -e "\e[1;35m╔════════════════════════════════════╗"
echo -e "║ 🎬 Bash Відео-Монтажер v1.0       ║"
echo -e "╚════════════════════════════════════╝\e[0m"

# 📦 Перевірка інструментів
for tool in yt-dlp ffmpeg find; do
  command -v $tool >/dev/null || {
    echo "❌ Не знайдено: $tool. Встановіть через pkg або pip."
    exit 1
  }
done

# 🔗 Введення URL
read -p "🔗 Вставте URL відео: " url
[[ -z "$url" ]] && echo "❌ URL не вказано. Вихід." && exit 1

# 📥 Завантаження відео
yt-dlp -f bestvideo+bestaudio --merge-output-format mp4 "$url" -o "%(title)s.%(ext)s"

# 🧠 Визначення останнього відео
latest=$(find . -maxdepth 1 -name "*.mp4" -printf "%T@ %p\n" | sort -nr | head -n1 | cut -d' ' -f2-)
base="${latest%.*}"
output="${base}_montage.mp4"

# 🎛️ Меню трансформацій
echo -e "\n🎛️ Оберіть трансформації:"
echo "1) 🔁 Реверс"
echo "2) ✂️  Обрізка (перші 10 сек)"
echo "3) 🌒 Затемнення"
echo "4) 🖼️  Вставка логотипу"
echo "5) ✅ Все одразу"
read -p "👉 Введіть номер (можна кілька через пробіл): " choice

# ⚙️ Побудова фільтрів
filters=""
audio_filter=""
trim=""
logo="logo.png"

for opt in $choice; do
  case $opt in
    1) filters+="reverse,"; audio_filter="areverse" ;;
    2) trim="-t 10" ;;
    3) filters+="eq=brightness=-0.3," ;;
    4) if [[ -f "$logo" ]]; then
         filters+="overlay=10:10,"
       else
         echo "⚠️ Логотип $logo не знайдено. Пропускаємо."
       fi ;;
    5) filters="reverse,eq=brightness=-0.3,overlay=10:10,"; audio_filter="areverse"; trim="-t 10" ;;
  esac
done

# 🧹 Очистка фільтрів
filters="${filters%,}"

# 🧪 Побудова команди ffmpeg
cmd="ffmpeg -i \"$latest\""
[[ -n "$trim" ]] && cmd+=" $trim"
[[ -n "$filters" ]] && cmd+=" -vf \"$filters\""
[[ -n "$audio_filter" ]] && cmd+=" -af \"$audio_filter\""
cmd+=" \"$output\""

# 🚀 Виконання
echo -e "\n🚀 Виконуємо команду:"
echo "$cmd"
eval "$cmd" 2>&1 | tee "${base}_log.txt"

# ✅ Завершення
echo -e "\n✅ Готово! Збережено як: $output"
termux-open "$output"
