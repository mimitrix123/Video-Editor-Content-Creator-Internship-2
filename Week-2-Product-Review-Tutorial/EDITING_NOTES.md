# Week 2 — Product Review / Tutorial

## Deliverable
3-minute product review/tutorial demonstrating a complete short-form editing workflow.

### Required elements
- Hook intro: 0:00–0:15
- Voiceover narration: full timeline
- Background music: low volume under narration
- Text call-outs: features, tips, and section labels
- Color correction: exposure/contrast/saturation normalization
- Subscribe CTA end screen: 2:45–3:00

## Suggested timeline
| Time | Visual | Audio | Graphics |
|---|---|---|---|
| 0:00–0:15 | Fast product close-ups / problem-solution shots | Hook VO + music | `3 FEATURES YOU SHOULD KNOW` |
| 0:15–0:45 | Unboxing / accessories | VO + music | `WHAT'S IN THE BOX?` |
| 0:45–1:20 | Product detail and fit shots | VO + music | `DESIGN • COMFORT` |
| 1:20–1:55 | Phone Bluetooth setup | VO + music | `PAIR IN 3 STEPS` |
| 1:55–2:25 | Controls / microphone / charging | VO + music | Feature call-outs |
| 2:25–2:45 | Product hero + checklist | VO + music | `PROS + WHAT TO CHECK` |
| 2:45–3:00 | End screen | VO + music fade | `SUBSCRIBE • COMMENT • WATCH NEXT` |

## Color correction
Use the footage's camera profile as the starting point. Normalize exposure and white balance first, then make modest contrast and saturation adjustments. Keep skin/product colors natural and consistent between shots.

The accompanying FFmpeg demo script uses the `eq` filter for a simple technical correction pass and `drawtext` for call-outs. FFmpeg documents both filtering and `drawtext` as part of its filter system.

## Audio mix target
- Voiceover: primary / clearly intelligible
- Background music: approximately -22 to -28 dB under speech
- Add short fades at the beginning and end
- Avoid clipping; leave headroom on the master

## Assets
For a real internship submission, use your own product footage or properly licensed stock footage and music. Keep license/source information in `ASSET_SOURCES.md`.

## Export
- Container: MP4
- Video: H.264
- Resolution: 1920×1080
- Frame rate: 30 fps
- Audio: AAC
- Target duration: 3:00
