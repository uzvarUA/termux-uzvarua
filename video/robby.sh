#!/data/data/com.termux/files/usr/bin/bash

# 🔽 Завантаження відео з Reddit
for url in $(curl -s -H "User-agent: 'your bot 0.1'" \
  https://www.reddit.com/r/TikTokCringe/hot.json?limit=12 | \
  jq -r '.data.children[].data.url_overridden_by_dest' | \
  grep -Eo "https:\/\/v\.redd\.it\/\w{13}"); do
    yt-dlp -f bestvideo+bestaudio "$url"
done

# 🔍 Перевірка наявності відео
shopt -s nullglob
files=(*.mp4)
if [ ${#files[@]} -eq 0 ]; then
  echo "❌ Немає відео для обробки."
  exit 1
fi

# 🎞 Обробка відео
mkdir -p blur
for f in *.mp4; do
  ffmpeg -i "$f" -lavfi \
  "[0:v]scale=ih*16/9:-1,boxblur=luma_radius=min(h\,w)/20:luma_power=1:chroma_radius=min(cw\,ch)/20:chroma_power=1[bg];[bg][0:v]overlay=(W-w)/2:(H-h)/2,crop=h=iw*9/16" \
  -vb 800K "blur/$f"
done

# 🎬 Конкатенація
rm -f file_list.txt
for f in blur/*.mp4; do echo "file '$f'" >> file_list.txt ; done
ffmpeg -f concat -safe 0 -i file_list.txt -c copy final.mp4

# 🧹 Прибирання
rm -rf blur *.mp4 file_list.txt
