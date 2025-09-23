#!/data/data/com.termux/files/usr/bin/bash

# 🌄 UzvarUA Panorama Maker for Minecraft Bedrock
# 📅 Created: 2025-09-23
# 🧃 Branded by Robby & Copilot

set -e

WORKDIR="$HOME/UzvarPanorama"
names=(panorama_0 panorama_1 panorama_2 panorama_3 panorama_4 panorama_5)

while true; do
  clear
  echo -e "\e[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
  echo -e "\e[1;35m     🌄 UzvarUA Panorama Maker\e[0m"
  echo -e "\e[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
  echo -e "\e[1;32m 1️⃣ Створити панораму з JPG\e[0m"
  echo -e "\e[1;31m 2️⃣ Вийти з меню\e[0m"
  echo -e "\e[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
  read -p "🔸 Виберіть дію: " choice

  case "$choice" in
    1)
      mkdir -p "$WORKDIR/textures/ui" "$WORKDIR/input"
      cd "$WORKDIR"

      command -v ffmpeg >/dev/null 2>&1 || {
        echo -e "\e[1;31m❌ ffmpeg не встановлено. Встановлюємо...\e[0m"
        pkg update && pkg install ffmpeg -y
      }

      echo -e "\e[1;33m📸 Вставте 6 .jpg зображень у $WORKDIR/input перед запуском.\e[0m"
      read -p "▶️ Натисніть Enter, коли готові..."

      i=0
      for file in input/*.png; do
        out="textures/ui/${names[$i]}.png"
        echo -e "\e[1;34m🎬 Обрізка $file → $out\e[0m"
        ffmpeg -i "$file" -vf "crop=1024:1024" "$out"
        ((i++))
      done

      # 🧠 UUID через Python
      uuidgen=$(python -c "import uuid; print(uuid.uuid4())")
      uuidgen2=$(python -c "import uuid; print(uuid.uuid4())")

      # 🧾 Створення manifest.json
      cat > manifest.json <<EOF
{
  "format_version": 2,
  "header": {
    "name": "UzvarUA Panorama",
    "description": "Custom Minecraft menu background",
    "uuid": "$uuidgen",
    "version": [1, 0, 0]
  },
  "modules": [{
    "type": "resources",
    "uuid": "$uuidgen2",
    "version": [1, 0, 0]
  }]
}
EOF

      ZIPNAME="UzvarPanorama.mcpack"
      echo -e "\e[1;32m📦 Упаковка у $ZIPNAME...\e[0m"
      zip -r "$ZIPNAME" manifest.json textures

      echo -e "\e[1;32m✅ Панорама створена: $WORKDIR/$ZIPNAME\e[0m"
      echo -e "\e[1;36m📲 Відкрийте файл через Minecraft для імпорту\e[0m"
      read -p "🔸 Натисніть Enter для повернення в меню..."
      ;;
    2)
      echo -e "\e[1;31m👋 До зустрічі, UzvarUA!\e[0m"
      break
      ;;
    *)
      echo -e "\e[1;31m⚠️ Невірний вибір. Спробуйте ще раз.\e[0m"
      sleep 1
      ;;
  esac
done
