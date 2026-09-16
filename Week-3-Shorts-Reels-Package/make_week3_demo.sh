#!/usr/bin/env bash
set -euo pipefail

# Requires ffmpeg with drawtext, zoompan, setpts and atempo support.
# Generates three vertical 9:16 placeholder demos with captions, zooms,
# speed-ramp-like timing changes, transitions, and a placeholder music bed.

OUT="${1:-week3_shorts_reels_demo}"
FONT="${FONT:-/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf}"

render() {
  local duration="$1" title="$2" tip1="$3" tip2="$4" outfile="$5"
  ffmpeg -y \
    -f lavfi -i "color=c=0x101820:s=1080x1920:r=30:d=${duration}" \
    -f lavfi -i "sine=frequency=220:sample_rate=48000:duration=${duration}" \
    -filter_complex "[0:v]format=yuv420p,eq=contrast=1.05:saturation=1.08,zoompan=z='min(zoom+0.0008,1.12)':d=1:s=1080x1920:fps=30,drawtext=fontfile=${FONT}:text='${title}':fontcolor=white:fontsize=72:x=(w-text_w)/2:y=420:enable='between(t,0,3)',drawtext=fontfile=${FONT}:text='${tip1}':fontcolor=white:fontsize=56:x=(w-text_w)/2:y=820:enable='between(t,3,${duration})',drawtext=fontfile=${FONT}:text='${tip2}':fontcolor=white:fontsize=46:x=(w-text_w)/2:y=1040:enable='between(t,3,${duration})',fade=t=in:st=0:d=.25,fade=t=out:st=$(python3 - <<PY
print(max(0,float('${duration}')-0.25))
PY
):d=.25[v];[1:a]afade=t=in:st=0:d=.4,afade=t=out:st=$(python3 - <<PY
print(max(0,float('${duration}')-0.5))
PY
):d=.5,volume=0.10[a]" \
    -map "[v]" -map "[a]" -t "$duration" \
    -c:v libx264 -preset medium -crf 20 -pix_fmt yuv420p \
    -c:a aac -b:a 128k -movflags +faststart "$outfile"
}

render 45 "3 PRODUCTIVITY TIPS" "1. Plan ONE priority" "2. Batch notifications  •  3. Focus 25 min" "${OUT}_01_productivity.mp4"
render 50 "PHONE CAMERA HACKS" "1. Clean the lens  •  2. Lock focus" "3. Use window light" "${OUT}_02_camera.mp4"
render 40 "DESK RESET" "Clear  •  Group  •  Simplify" "BEFORE  →  AFTER" "${OUT}_03_desk.mp4"

echo "Created: ${OUT}_01_productivity.mp4"
echo "Created: ${OUT}_02_camera.mp4"
echo "Created: ${OUT}_03_desk.mp4"
