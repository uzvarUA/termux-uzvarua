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

# ✅ Завершення
echo "✅ Структура ресурс-паку створена в UzvarManifest/"
echo "📁 Включає: manifest.json + textures/ui/"
