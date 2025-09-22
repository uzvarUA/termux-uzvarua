#!/data/data/com.termux/files/usr/bin/bash

# 🌀 UzvarUA Panorama Generator
# 🎮 For Minecraft Bedrock Edition on Android 13

# 🎨 Стиль
BOLD="\e[1m"
RESET="\e[0m"
GREEN="\e[32m"
RED="\e[31m"
CYAN="\e[36m"
MAGENTA="\e[35m"

echo -e "${MAGENTA}${BOLD}╔════════════════════════════════════╗"
echo -e "║   🌀 UzvarUA Minecraft Panorama    ║"
echo -e "╚════════════════════════════════════╝${RESET}"

# 📁 Створення директорії
mkdir -p panorama

# 📦 Перевірка source.png
if [[ ! -f source.png ]]; then
  echo -e "${RED}❌ source.png не знайдено. Помісти файл у поточну директорію.${RESET}"
  exit 1
fi

# 🧩 Генерація граней з source.png
echo -e "${CYAN}🔧 Генеруємо граней з source.png...${RESET}"

ffmpeg -i source.png -vf "crop=1024:1024:0:512"     panorama/panorama_0.png   # Left
ffmpeg -i source.png -vf "crop=1024:1024:1024:512"  panorama/panorama_1.png   # Front
ffmpeg -i source.png -vf "crop=1024:1024:2048:512"  panorama/panorama_2.png   # Right
ffmpeg -i source.png -vf "crop=1024:1024:3072:512"  panorama/panorama_3.png   # Back
ffmpeg -i source.png -vf "crop=1024:1024:1024:0"    panorama/panorama_4.png   # Top
ffmpeg -i source.png -vf "crop=1024:1024:1024:1024" panorama/panorama_5.png   # Bottom

# 🌀 Додатково: якщо є файли типу 0.png, 1.png…
for i in {0..5}; do
  if [[ -f "${i}.png" ]]; then
    echo -e "${GREEN}📸 Знайдено ${i}.png — генеруємо panorama_${i}.png...${RESET}"
    ffmpeg -i "${i}.png" -vf "crop=1024:1024:0:512" "panorama/panorama_${i}.png"
  fi
done

# ✅ Завершено
echo -e "${GREEN}${BOLD}✅ Панорама готова в ./panorama${RESET}"
