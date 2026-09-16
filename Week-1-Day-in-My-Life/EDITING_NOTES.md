# Editing Notes — Week 1

## Creative direction

Clean, modern vlog pacing with six chapters representing a normal day. Large chapter headings establish time and activity; supporting lines provide narrative context.

## Timeline

- **00:00–00:06** — Title card: `DAY IN MY LIFE`
- **00:06–00:20** — Title hold / intro atmosphere
- **00:20–00:41** — Morning routine
- **00:40–01:01** — Deep work
- **01:00–01:21** — Lunch break
- **01:20–01:41** — Evening / outside
- **01:40–02:01** — Wind down / closing chapter

The one-second overlaps are intentional so the transitions feel continuous while retaining visible scene changes.

## Transition plan

- Title → Morning: **Fade**
- Morning → Deep Work: **Slide Left**
- Deep Work → Lunch: **Fade to Black**
- Lunch → Evening: **Slide Right**
- Evening → Wind Down: **Fade**

## Audio

An original, low-volume ambient sine-tone bed is embedded as AAC audio at 96 kbps. It is intentionally subtle so it does not compete with the text overlays.

## Export settings

- Container: MP4
- Video codec: H.264
- Audio codec: AAC
- Resolution: 1920×1080
- FPS: 30
- Duration: 121 seconds

## Rebuild

Run:

```bash
bash make_vlog.sh
```

The script generates `day_in_my_life_1080p.mp4` in the same directory.

## Portfolio note

For a production submission, replace each generated scene with licensed stock footage or original clips. Keep the same 1080p sequence, timing, transition map, overlay hierarchy, and audio workflow.
