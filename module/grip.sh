#!/data/data/com.termux/files/usr/bin/bash
set -euo pipefail

echo "🔧 Встановлення Grip для перегляду Markdown у стилі GitHub (Termux)…"

# Перевірка наявності pip3
if ! command -v pip3 &> /dev/null; then
    echo "❌ pip3 не знайдено. Встанови Python 3 та pip3 через pkg install python."
    exit 1
fi

# Встановлення grip
pip3 install grip

echo "✅ Grip успішно встановлено!"
echo "📂 Тепер можеш запустити: grip README.md"
echo "🌐 Відкрий у браузері: http://127.0.0.1:6419"
