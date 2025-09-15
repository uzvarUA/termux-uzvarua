#!/data/data/com.termux/files/usr/bin/bash

# Перехід у директорію
cd ~/termux-uzvarua/Mr.Holmes || {
  echo "❌ Директорія ~/termux-uzvarua/Mr.Holmes не знайдена"; exit 1;
}

# Запуск Python-скрипта
python3 MrHolmes.py || {
  echo "❌ Помилка при запуску MrHolmes.py"; exit 1;
}
