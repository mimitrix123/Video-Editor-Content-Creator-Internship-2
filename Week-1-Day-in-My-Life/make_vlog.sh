#!/usr/bin/env bash
set -euo pipefail
OUT="day_in_my_life_1080p.mp4"
FONT="/usr/share/fonts/truetype/liberation2/LiberationSans-Regular.ttf"
BOLD="/usr/share/fonts/truetype/liberation2/LiberationSans-Bold.ttf"

# Self-contained Week 1 demo: six 21-second scenes, 1-second transitions,
# 1080p/30fps H.264 video and original low-volume ambient AAC audio.
ffmpeg -y \
  -f lavfi -i "color=c=0x15202b:s=1920x1080:r=30:d=21,format=yuv420p,drawtext=fontfile=$BOLD:text='DAY IN MY LIFE':fontcolor=white:fontsize=110:x=(w-text_w)/2:y=360:enable='between(t,0,6)',drawtext=fontfile=$FONT:text='A simple day - Week 1 Vlog':fontcolor=white:fontsize=46:x=(w-text_w)/2:y=500:enable='between(t,1,6)',drawbox=x=0:y=0:w=1920:h=1080:color=0x000000@0.08:t=fill" \
  -f lavfi -i "color=c=0xF3C969:s=1920x1080:r=30:d=21,format=yuv420p,drawtext=fontfile=$BOLD:text='07-00  -  MORNING':fontcolor=0x15202b:fontsize=90:x=120:y=150,drawtext=fontfile=$FONT:text='Wake up, water, coffee & a little planning.':fontcolor=0x15202b:fontsize=48:x=120:y=300,drawtext=fontfile=$FONT:text='Start slow. Start focused.':fontcolor=0x15202b:fontsize=42:x=120:y=380,drawtext=fontfile=$BOLD:text='MORNING ROUTINE':fontcolor=0x15202b:fontsize=34:x=120:y=850" \
  -f lavfi -i "color=c=0x78A6C8:s=1920x1080:r=30:d=21,format=yuv420p,drawtext=fontfile=$BOLD:text='09-00  -  DEEP WORK':fontcolor=white:fontsize=90:x=120:y=150,drawtext=fontfile=$FONT:text='Laptop open. Headphones on.':fontcolor=white:fontsize=52:x=120:y=300,drawtext=fontfile=$FONT:text='Editing - Writing - Learning':fontcolor=white:fontsize=48:x=120:y=390,drawtext=fontfile=$BOLD:text='FOCUS MODE':fontcolor=white:fontsize=36:x=120:y=850" \
  -f lavfi -i "color=c=0xF08A5D:s=1920x1080:r=30:d=21,format=yuv420p,drawtext=fontfile=$BOLD:text='13-00  -  LUNCH BREAK':fontcolor=white:fontsize=86:x=120:y=150,drawtext=fontfile=$FONT:text='Step away from the screen.':fontcolor=white:fontsize=52:x=120:y=300,drawtext=fontfile=$FONT:text='Good food - Fresh air - Reset':fontcolor=white:fontsize=48:x=120:y=390,drawtext=fontfile=$BOLD:text='RESET & RECHARGE':fontcolor=white:fontsize=36:x=120:y=850" \
  -f lavfi -i "color=c=0x6B8E7B:s=1920x1080:r=30:d=21,format=yuv420p,drawtext=fontfile=$BOLD:text='17-30  -  OUT & ABOUT':fontcolor=white:fontsize=90:x=120:y=150,drawtext=fontfile=$FONT:text='A walk, a few errands, and some golden-hour light.':fontcolor=white:fontsize=48:x=120:y=300,drawtext=fontfile=$FONT:text='Small moments make the day.':fontcolor=white:fontsize=46:x=120:y=390,drawtext=fontfile=$BOLD:text='EVENING VIBES':fontcolor=white:fontsize=36:x=120:y=850" \
  -f lavfi -i "color=c=0x352F44:s=1920x1080:r=30:d=21,format=yuv420p,drawtext=fontfile=$BOLD:text='21-00  -  WIND DOWN':fontcolor=white:fontsize=90:x=120:y=150,drawtext=fontfile=$FONT:text='Dinner, music, reflection, and tomorrow’s plan.':fontcolor=white:fontsize=48:x=120:y=300,drawtext=fontfile=$FONT:text='Done for today. Ready for tomorrow.':fontcolor=white:fontsize=46:x=120:y=390,drawtext=fontfile=$BOLD:text='GOOD NIGHT':fontcolor=white:fontsize=36:x=120:y=850" \
  -f lavfi -i "sine=frequency=220:sample_rate=44100:duration=121,volume=0.045" \
  -filter_complex "[0:v]setsar=1[v0];[1:v]setsar=1[v1];[2:v]setsar=1[v2];[3:v]setsar=1[v3];[4:v]setsar=1[v4];[5:v]setsar=1[v5];[v0][v1]xfade=transition=fade:duration=1:offset=20[x1];[x1][v2]xfade=transition=slideleft:duration=1:offset=40[x2];[x2][v3]xfade=transition=fadeblack:duration=1:offset=60[x3];[x3][v4]xfade=transition=slideright:duration=1:offset=80[x4];[x4][v5]xfade=transition=fade:duration=1:offset=100[v]" \
  -map "[v]" -map 6:a -t 121 -r 30 -c:v libx264 -preset veryfast -crf 28 -pix_fmt yuv420p -c:a aac -b:a 96k -movflags +faststart "$OUT"

echo "Created $OUT (1920x1080, 30fps, 121s)"
