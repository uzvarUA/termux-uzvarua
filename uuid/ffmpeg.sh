#!/data/data/com.termux/files/usr/bin/bash

# 🧪 Перевірка Python
if ! command -v python &> /dev/null; then
  echo "⚠️ Python не знайдено! Встановлюю..."
  pkg install python -y
fi

# 🧪 Перевірка pip3
if ! command -v pip3 &> /dev/null; then
  echo "⚠️ pip3 не знайдено! Встановлюю..."
  pkg install python-pip -y
fi

# 🧪 Перевірка ffmpeg
if ! command -v ffmpeg &> /dev/null; then
  echo "🎬 ffmpeg не знайдено! Встановлюю..."
  pkg install ffmpeg -y
fi

# 🧪 Перевірка yt-dlp
if ! command -v yt-dlp &> /dev/null; then
  echo "📥 yt-dlp не знайдено! Встановлюю..."
  pip3 install yt-dlp
fi

# 🌿 Введення даних
read -p "📦 Назва паку: " packname
read -p "📝 Опис: " description
read -p "🎮 Мінімальна версія Minecraft (1,21,0 або 1 21 0): " version_raw

# 🔁 Автоформатування версії
version_clean=${version_raw// /,}
if [[ ! "$version_clean" =~ ^[0-9]+,[0-9]+,[0-9]+$ ]]; then
  echo "⚠️ Невірний формат! Використовуйте 1,21,0 або 1 21 0"
  exit 1
fi
version_json=${version_clean//,/ }

# 🆔 UUID
uuid_header=$(python -c "import uuid; print(uuid.uuid4())")
uuid_module=$(python -c "import uuid; print(uuid.uuid4())")

# 📁 Створення структури
mkdir -p UzvarManifest/textures/ui
for i in {0..5}; do
  touch UzvarManifest/textures/ui/panorama_${i}.png
done

# 📜 manifest.json
cat > UzvarManifest/manifest.json <<EOF
{
  "format_version": 2,
  "header": {
    "name": "$packname",
    "description": "$description",
    "uuid": "$uuid_header",
    "version": [1, 0, 0],
    "min_engine_version": [${version_json}]
  },
  "modules": [
    {
      "type": "resources",
      "uuid": "$uuid_module",
      "version": [1, 0, 0]
    }
  ]
}
EOF

# ✅ Завершення структури
echo "✅ Структура ресурс-паку створена в UzvarManifest/"
echo "📁 Включає: manifest.json + textures/ui/"

# 📂 Перехід до директорії
cd UzvarManifest/textures/ui || exit 1

# 🧹 Очистка попередніх панорам (якщо є)
echo "🧹 Очищаю старі панорами..."
rm -f panorama_*.png

# 🌐 Завантаження відео
read -p "🌍 Встав URL відео для генерації панорам: " video_url
echo "📥 Завантажую відео з yt-dlp..."
yt-dlp -f bestaudio+bestvideo -o temp.mp4 "$video_url"

# 🎞️ Витяг кадрів
echo "🎬 Витяг кадрів з відео..."
for i in {0..5}; do
  timestamp=$((i * 2)) # кожні 2 секунди
  ffmpeg -ss "$timestamp" -i temp.mp4 -frames:v 1 -vf "scale=512:512" panorama_${i}.png
  echo "🖼️ Створено: panorama_${i}.png (секунда $timestamp)"
done

# 🧹 Прибирання
rm temp.mp4
echo "🧹 Тимчасовий файл temp.mp4 видалено"
