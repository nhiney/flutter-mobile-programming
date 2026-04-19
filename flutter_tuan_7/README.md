# Flutter Lab 07 – Multimedia

A Flutter application demonstrating multimedia access on mobile devices: camera, gallery, video playback, audio playback, and SQLite user management.

## Features

| Exercise | Name | Description |
|----------|------|-------------|
| 1 | Media Picker App | Pick images/videos from gallery or capture from camera |
| 2 | Photo Capture & Preview | Capture/select photos with full-screen preview |
| 3 | Video Recorder & Playback | Record/select videos with play/pause controls |
| 4 | Simple Audio Player | Play audio assets with Previous / Play / Pause / Stop / Next |
| 5 | Premium Music Player | Stylised music player with album view and playlist |
| 6 | User Account Manager | SQLite-backed user list with avatar from device gallery |

## Project Structure

```
lib/
├── core/
│   └── config/
│       └── app_config.dart        # JSON config singleton
├── features/
│   ├── audio_player/              # Exercise 4
│   ├── menu/                      # Main navigation
│   ├── music_player/              # Exercise 5
│   ├── photo_capture/             # Exercise 2
│   ├── user_management/           # Exercise 6
│   └── video_recorder/            # Exercise 3
├── main.dart
└── media_picker_home.dart         # Exercise 1
assets/
├── audios/                        # Audio files (sample1.mp3 …)
└── config/
    └── app_config.json            # All configurable values
```

## Configuration

All configurable values are stored in `assets/config/app_config.json`. Edit that file to change them without touching Dart code:

```json
{
  "app": { "title": "Multimedia Lab 07" },
  "media_picker": { "image_quality": 100, "max_width": 1920, "max_height": 1080 },
  "video_recorder": { "sample_video_url": "..." },
  "audio_player": { "songs": [ ... ] },
  "music_player": { "songs": [ ... ] },
  "user_management": { "default_country": "Vietnam", "countries": [ ... ] }
}
```

## Setup

### 1. Install dependencies
```bash
flutter pub get
```

### 2. Add audio files (Exercise 4 & 5)
Place `.mp3` files inside `assets/audios/` and name them to match the `asset` fields in `app_config.json` (default: `sample1.mp3`, `sample2.mp3`, `sample3.mp3`).

### 3. Android permissions
Already declared in `android/app/src/main/AndroidManifest.xml`:
- `CAMERA`
- `RECORD_AUDIO`
- `READ_MEDIA_IMAGES`
- `READ_MEDIA_VIDEO`
- `READ_EXTERNAL_STORAGE` / `WRITE_EXTERNAL_STORAGE`

### 4. iOS permissions
Already declared in `ios/Runner/Info.plist`:
- `NSCameraUsageDescription`
- `NSMicrophoneUsageDescription`
- `NSPhotoLibraryUsageDescription`
- `NSPhotoLibraryAddUsageDescription`

### 5. Run
```bash
flutter run
```

## Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `image_picker` | ^1.1.2 | Pick images/videos from gallery or camera |
| `video_player` | ^2.9.1 | Play video files |
| `permission_handler` | ^11.3.1 | Runtime permission management |
| `audioplayers` | ^6.1.0 | Play audio assets |
| `sqflite` | ^2.3.3 | SQLite database for user management |
| `path` | ^1.9.0 | File path utilities |
| `intl` | ^0.19.0 | Date formatting |

## Architecture

- **Feature-based** folder structure – each exercise is an independent feature.
- **OOP** – `AppConfig` singleton, model classes (`User`, `Song`), dedicated widget classes.
- **Config-driven** – no magic strings or numbers in Dart code; all tuneable values live in `app_config.json`.
- **Permission handling** – permissions are requested just-in-time before each operation and never silently ignored.
