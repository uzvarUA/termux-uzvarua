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

# 🧙 УзварUA UUID Меню
clear
echo "🌿 UzvarUA UUID & manifest.json генератор"
echo "────────────────────────────────────────"
echo "1️⃣  Згенерувати UUIDv4"
echo "2️⃣  Згенерувати UUIDv5 (на основі імені)"
echo "3️⃣  Створити manifest.json для Minecraft PE"
echo "0️⃣  Вихід"
echo "────────────────────────────────────────"
read -p "🔸 Вибери опцію: " choice

case $choice in
  1)
    uuid=$(python -c "import uuid; print(uuid.uuid4())")
    echo "🆔 UUIDv4: $uuid"
    termux-clipboard-set "$uuid"
    echo "📋 Скопійовано в буфер!"
    ;;

  2)
    read -p "🔹 Введи ім’я для UUIDv5: " name
    uuid=$(python -c "import uuid; print(uuid.uuid5(uuid.NAMESPACE_DNS, '$name'))")
    echo "🆔 UUIDv5: $uuid"
    termux-clipboard-set "$uuid"
    echo "📋 Скопійовано в буфер!"
    ;;

  3)
    read -p "📦 Назва паку: " packname
    read -p "📝 Опис: " description
    uuid_header=$(python -c "import uuid; print(uuid.uuid4())")
    uuid_module=$(python -c "import uuid; print(uuid.uuid4())")

    mkdir -p UzvarManifest
    cat > UzvarManifest/manifest.json <<EOF
{
  "format_version": 2,
  "header": {
    "name": "$packname",
    "description": "$description",
    "uuid": "$uuid_header",
    "version": [1, 0, 0]
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

    echo "✅ manifest.json створено в UzvarManifest/"
    termux-clipboard-set "$uuid_header"
    echo "📋 UUID паку скопійовано в буфер!"
    ;;

  0)
    echo "👋 До зустрічі, UzvarUA-чарівнику!"
    exit
    ;;

  *)
    echo "⚠️ Невірний вибір!"
    ;;
esac
