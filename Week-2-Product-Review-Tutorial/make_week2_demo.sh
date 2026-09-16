#!/usr/bin/env bash
set -euo pipefail

# Week 2 self-contained 3-minute demo.
# Replace generated color scenes with your own/licensed product clips for final submission.
OUT="week2_product_review_1080p.mp4"
FONT="/usr/share/fonts/truetype/liberation2/LiberationSans-Regular.ttf"
BOLD="/usr/share/fonts/truetype/liberation2/LiberationSans-Bold.ttf"

# 7 scenes: 15s hook + 30s + 35s + 35s + 30s + 20s + 15s CTA = 180s.
# Each scene demonstrates call-outs, a consistent visual treatment and transitions.
ffmpeg -y \
  -f lavfi -i "color=c=0x111827:s=1920x1080:r=30:d=15,format=yuv420p,eq=contrast=1.08:brightness=0.02:saturation=1.08,drawtext=fontfile=$BOLD:text='3 THINGS TO KNOW BEFORE YOU BUY':fontcolor=white:fontsize=82:x=(w-text_w)/2:y=390,drawtext=fontfile=$FONT:text='Wireless Earbuds — 3-Minute Review':fontcolor=white:fontsize=42:x=(w-text_w)/2:y=510" \
  -f lavfi -i "color=c=0x243447:s=1920x1080:r=30:d=30,format=yuv420p,eq=contrast=1.06:brightness=0.03:saturation=1.10,drawtext=fontfile=$BOLD:text='WHAT\'S IN THE BOX?':fontcolor=white:fontsize=78:x=110:y=150,drawtext=fontfile=$FONT:text='Earbuds • Case • Ear Tips • Cable':fontcolor=white:fontsize=48:x=110:y=300,drawtext=fontfile=$BOLD:text='UNBOXING':fontcolor=white:fontsize=34:x=110:y=860" \
  -f lavfi -i "color=c=0x38556B:s=1920x1080:r=30:d=35,format=yuv420p,eq=contrast=1.10:brightness=0.02:saturation=1.12,drawtext=fontfile=$BOLD:text='DESIGN + COMFORT':fontcolor=white:fontsize=78:x=110:y=150,drawtext=fontfile=$FONT:text='Choose a secure, comfortable ear-tip fit.':fontcolor=white:fontsize=50:x=110:y=310,drawtext=fontfile=$BOLD:text='FIT CHECK':fontcolor=white:fontsize=34:x=110:y=860" \
  -f lavfi -i "color=c=0x314E52:s=1920x1080:r=30:d=35,format=yuv420p,eq=contrast=1.07:brightness=0.04:saturation=1.05,drawtext=fontfile=$BOLD:text='PAIR IN 3 STEPS':fontcolor=white:fontsize=78:x=110:y=150,drawtext=fontfile=$FONT:text='1. Open Bluetooth   2. Select earbuds   3. Confirm':fontcolor=white:fontsize=43:x=110:y=310,drawtext=fontfile=$BOLD:text='SETUP TUTORIAL':fontcolor=white:fontsize=34:x=110:y=860" \
  -f lavfi -i "color=c=0x4A3B55:s=1920x1080:r=30:d=30,format=yuv420p,eq=contrast=1.08:brightness=0.02:saturation=1.08,drawtext=fontfile=$BOLD:text='EVERYDAY FEATURES':fontcolor=white:fontsize=78:x=110:y=150,drawtext=fontfile=$FONT:text='Controls • Microphone • Battery • Charging':fontcolor=white:fontsize=46:x=110:y=310,drawtext=fontfile=$BOLD:text='FEATURE CHECK':fontcolor=white:fontsize=34:x=110:y=860" \
  -f lavfi -i "color=c=0x4C5145:s=1920x1080:r=30:d=20,format=yuv420p,eq=contrast=1.09:brightness=0.03:saturation=1.07,drawtext=fontfile=$BOLD:text='PROS + WHAT TO CHECK':fontcolor=white:fontsize=72:x=110:y=150,drawtext=fontfile=$FONT:text='Portability • Pairing • Comfort • Compatibility':fontcolor=white:fontsize=44:x=110:y=310,drawtext=fontfile=$BOLD:text='BUYING CHECKLIST':fontcolor=white:fontsize=34:x=110:y=860" \
  -f lavfi -i "color=c=0x0F172A:s=1920x1080:r=30:d=15,format=yuv420p,drawtext=fontfile=$BOLD:text='SUBSCRIBE FOR MORE':fontcolor=white:fontsize=86:x=(w-text_w)/2:y=350,drawtext=fontfile=$FONT:text='Comment the next product you want reviewed':fontcolor=white:fontsize=42:x=(w-text_w)/2:y=500,drawtext=fontfile=$BOLD:text='LIKE  •  SUBSCRIBE  •  WATCH NEXT':fontcolor=white:fontsize=34:x=(w-text_w)/2:y=610" \
  -f lavfi -i "sine=frequency=220:sample_rate=44100:duration=180,volume=0.035" \
  -filter_complex "[0:v]setsar=1[v0];[1:v]setsar=1[v1];[2:v]setsar=1[v2];[3:v]setsar=1[v3];[4:v]setsar=1[v4];[5:v]setsar=1[v5];[6:v]setsar=1[v6];[v0][v1]xfade=transition=fade:duration=1:offset=14[x1];[x1][v2]xfade=transition=slideleft:duration=1:offset=43[x2];[x2][v3]xfade=transition=fadeblack:duration=1:offset=77[x3];[x3][v4]xfade=transition=slideright:duration=1:offset=111[x4];[x4][v5]xfade=transition=fade:duration=1:offset=140[x5];[x5][v6]xfade=transition=fade:duration=1:offset=159[v];[6:a]volume=0.035[music];[music]afade=t=in:st=0:d=2,afade=t=out:st=176:d=4[m]" \
  -map "[v]" -map "[m]" -t 180 -r 30 -c:v libx264 -preset veryfast -crf 27 -pix_fmt yuv420p -c:a aac -b:a 96k -movflags +faststart "$OUT"

echo "Created $OUT (1920x1080, 30fps, 180s)"
