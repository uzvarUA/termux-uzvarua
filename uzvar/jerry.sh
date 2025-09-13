#!/data/data/com.termux/files/usr/bin/bash

# 🎯 Визначення архітектури Android-пристрою
ARCH=$(getprop ro.product.cpu.abi)

# 🎨 Кольори
GREEN='\033[1;32m'
RED='\033[1;31m'
NC='\033[0m' # No Color

# 📦 Вивід
echo -e "${GREEN}📱 Ваша архітектура: ${RED}$ARCH${NC}"

# 🔍 Підказка
case "$ARCH" in
  arm64-v8a)
    echo -e "✅ Використовуйте: app-arm64-v8a-debug.apk"
    ;;
  armeabi-v7a)
    echo -e "🟡 Використовуйте: app-armeabi-v7a-debug.apk"
    ;;
  x86)
    echo -e "💻 Використовуйте: app-x86-debug.apk (емулятор або Intel)"
    ;;
  x86_64)
    echo -e "💻 Використовуйте: app-x86_64-debug.apk"
    ;;
  *)
    echo -e "⚠️ Невідома архітектура. Рекомендується universal: app-universal-debug.apk"
    ;;
esac
