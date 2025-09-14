#!/data/data/com.termux/files/usr/bin/bash

# 🌐 Maigret Installer for Termux
# 🛠️ Author: Robбі-style automation

echo -e "\n🔍 Перевірка залежностей..."

# Перевірка Python
if ! command -v python &> /dev/null; then
    echo "❌ Python не знайдено. Встановлюємо..."
    pkg install -y python || { echo "🚫 Не вдалося встановити Python"; exit 1; }
else
    echo "✅ Python знайдено"
fi

# Перевірка pip
if ! command -v pip &> /dev/null; then
    echo "❌ pip не знайдено. Встановлюємо..."
    python -m ensurepip || { echo "🚫 Не вдалося встановити pip"; exit 1; }
else
    echo "✅ pip знайдено"
fi

echo -e "\n📦 Встановлення Maigret..."

pip3 install maigret || { echo "🚫 Помилка при встановленні Maigret"; exit 1; }

echo -e "\n🎉 Maigret успішно встановлено!"

# 🔎 Перевірка версії
echo -e "\n🧪 Перевірка версії Maigret..."
maigret --version && echo "✅ Версія перевірена успішно!" || echo "⚠️ Не вдалося отримати версію Maigret"

echo -e "\n📚 Запуск: maigret username"
