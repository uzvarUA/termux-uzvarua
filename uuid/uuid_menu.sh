#!/data/data/com.termux/files/usr/bin/bash

clear
echo -e "\e[1;32m UUID і manifest.json \e[0m"
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
read -p "🎮 Введіть мінімальну версію Minecraft (наприклад, 1,21,0): " version

# 🧪 Перевірка формату версії
if [[ ! "$version" =~ ^[0-9]+,[0-9]+,[0-9]+$ ]]; then
  echo "⚠️ Невірний формат версії! Використовуй формат: 1,21,0"
  exit 1
fi

# 🆔 Генерація UUID
uuid_header=$(python -c "import uuid; print(uuid.uuid4())")
uuid_module=$(python -c "import uuid; print(uuid.uuid4())")

# 📁 Створення manifest.json
mkdir -p UzvarManifest
cat > UzvarManifest/manifest.json <<EOF
{
  "format_version": 2,
  "header": {
    "name": "$packname",
    "description": "$description",
    "uuid": "$uuid_header",
    "version": [1, 0, 0],
    "min_engine_version": [${version//,/ }]
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

# 📋 Копіювання UUID
# termux-clipboard-set "$uuid_header"
echo "✅ manifest.json створено в UzvarManifest/"
# echo "📋 UUID паку скопійовано в буфер!"
