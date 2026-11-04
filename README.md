# VyPlay: Ad-Free YouTube Client

![VyPlay](doc/banner.jpg)

<p align="center">
<a href="https://github.com/bhaikamil109-ship-it/VyPlay./releases" alt="GitHub release"><img src="https://img.shields.io/github/release/bhaikamil109-ship-it/VyPlay..svg" ></a>
<a href="https://www.gnu.org/licenses/gpl-3.0.en.html" alt="GitHub release"><img src="https://shields.io/badge/License-GPL%20v3-blue.svg" ></a>
  <a href="https://github.com/bhaikamil109-ship-it/VyPlay./releases" alt="GitHub release"><img src="https://shields.io/badge/Flutter-v3.47.1-blue.svg" ></a>
  <a href="https://github.com/bhaikamil109-ship-it/VyPlay./actions/workflows/flutter-ci.yml" alt="Flutter CI"><img src="https://github.com/bhaikamil109-ship-it/VyPlay./actions/workflows/flutter-ci.yml/badge.svg" ></a>
</p>

A clean, ad-free YouTube client built with Flutter. Watch YouTube videos without ads, subscribe to channels, retrieve video dislikes, read comments, save videos, and more.

> **Note:** VyPlay is a derivative work of [FluxTube](https://github.com/mu-fazil-vk/fluxtube) (GPLv3). It keeps the same multi-backend architecture and adds VyPlay branding, a dedicated Shorts feed, an FFmpeg-based download merge, and additional localisation. Upstream attribution is preserved in the app's About screen as required by the licence.

## Features

- **No Login Needed**: Use the app without any login requirements.
- **Ad-Free Experience**: Enjoy YouTube videos without interruptions.
- **Multiple YouTube Services**: Switch between NewPipe Extractor, Piped, Invidious, or Explode backends.
- **Download Videos**: Download videos and audio in multiple qualities with FFmpeg merging support.
- **Dedicated Shorts Feed**: A real Shorts tab backed by channel Shorts tabs, not a fixed search query.
- **Background Playback**: Continue listening with notification controls (play/pause/seek).
- **Picture-in-Picture**: System PiP mode - auto-enters when pressing home while playing.
- **SponsorBlock**: Auto-skip sponsored segments, intros, outros, and more.
- **Multiple Profiles**: Separate subscriptions, history, and saved videos per profile.
- **Channel Subscriptions**: Subscribe to your favorite channels.
- **Dislike Retrieval**: See the number of dislikes on videos.
- **Comment Section**: Read video comments and replies.
- **Save Videos**: Save videos to watch later with search and sorting.
- **Deep Linking**: Open YouTube links directly in VyPlay.
- **NewPipe-Compatible Backup**: Import/export data as NewPipe-compatible ZIP files.
- **Select Your Region**: Customize the content based on your region.
- **Multi-Language Support**: 12 languages supported (including Hindi).
- **Watch live streams**: Enjoy live content.
- **Video Fit Modes**: Contain, cover, fill, fit-width, fit-height.
- **Customizable Skip Interval**: Double-tap to skip 5-60 seconds.
- **Watch Videos up to 4K Quality**: Enjoy videos in high quality up to 4K resolution.
- **Distraction-Free Mode**: Hide comments and related videos.

###### Note:

Some features are only available when using the NewPipe Extractor service.

## Screenshots

<div align="center">
  <img src="doc/home.png" alt="VyPlay Home" width="22%">
  <img src="doc/watch.png" alt="VyPlay Watch" width="22%">
  <img src="doc/trending.png" alt="VyPlay Trending" width="22%">
  <img src="doc/settings.png" alt="VyPlay settings" width="22%">
</div>

## Download

<p>
  <a href="https://github.com/bhaikamil109-ship-it/VyPlay./releases">
    <img alt="Get it on GitHub" src="doc/get-it-on-gb.png" width="200">
  </a>
</p>

You can download the latest version of the app from the [releases page](https://github.com/bhaikamil109-ship-it/VyPlay./releases).

## VyPlay vs NewPipe App

If you select "NewPipe Extractor" as your YouTube service in VyPlay, it uses the same [NewPipe Extractor](https://github.com/TeamNewPipe/NewPipeExtractor) library under the hood. So what's the difference?

|                             | VyPlay                                             | NewPipe App                   |
| --------------------------- | -------------------------------------------------- | ----------------------------- |
| **Framework**         | Flutter (cross-platform)                           | Native Android (Kotlin/Java)  |
| **Multiple Backends** | Yes (NewPipe Extractor, Piped, Invidious, Explode) | No (NewPipe Extractor only)   |
| **Fallback Options**  | Switch service if one breaks                       | Wait for app update           |
| **SponsorBlock**      | Built-in                                           | Requires fork (e.g., Tubular) |
| **Multiple Profiles** | Yes                                                | No                            |
| **Download**          | Yes (all services, with FFmpeg merging)            | Yes                           |
| **Background Play**   | Yes (with notification controls)                   | Yes                           |
| **System PiP**        | Yes (auto-enter on home press)                     | Yes                           |

**TL;DR:** VyPlay gives you options. If NewPipe Extractor stops working tomorrow, you can switch to Piped or Invidious and keep watching.

## Recommended Settings

For the best experience:

| Use Case                                | YouTube Service    | Notes                                                 |
| --------------------------------------- | ------------------ | ----------------------------------------------------- |
| **Recommended**                   | NewPipe Extractor  | Direct extraction, most reliable, no instances needed |
| **When NewPipe Extractor breaks** | Piped or Invidious | Instance-based, switch if one goes down               |

> **Tip:** Click on  "Auto-Check Instances" in settings for automatic failover when an instance becomes unavailable.

## Todo

- [X] Playlist Support
- [X] Picture in Picture Mode
- [X] Channel Profile Support
- [X] Subtitle Support
- [X] Unlimited Scroll Support
- [X] User Profiles
- [X] SponsorBlock
- [X] NewPipe-Compatible Backup/Restore
- [X] Deep Linking / Share Intent
- [X] Search History
- [X] Download Videos (all services)
- [X] Background Playback with Notification Controls
- [X] Android System Picture-in-Picture
- [X] Save Downloads to Public Storage
- [X] Database Migration (Isar → Drift)
- [X] Dedicated Shorts Feed
- [X] FFmpeg-based Download Merge (replaces MediaMuxer)
- [X] Hindi Localisation

## Contribution

Contributions are welcome! Whether you have ideas, translations, design changes, code cleaning, or even major code changes, help is always welcome.

If you have any ideas, suggestions, or issues, please open a [new issue](https://github.com/bhaikamil109-ship-it/VyPlay./issues) or submit a pull request.

1. Fork the repository.
2. Create a new branch: `git checkout -b my-feature-branch`
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin my-feature-branch`
5. Submit a pull request.

   #### Note:

   - Flutter version: `3.47.1`
   - Build runner command (Drift, Freezed, Injectable, JSON serialization): `flutter pub run build_runner build --delete-conflicting-outputs`
   - Translation command: `dart run intl_utils:generate`

## License

VyPlay is a free software licensed under GPL v3.0. It is a derivative work of [FluxTube](https://github.com/mu-fazil-vk/fluxtube), also GPLv3.

## Privacy Policy

The VyPlay project is designed to offer a private, anonymous YouTube experience. The app ensures no data is collected without your explicit consent. Your privacy is a top priority. Enjoy watching YouTube securely with VyPlay.

## Warning

```
This project was created for learning purposes and is not affiliated with any content provider. 
All videos, content, and trademarks are the property of their respective owners. 
VyPlay is not responsible for any copyright infringements. This software is provided "as-is" without 
any warranty, and the author is not liable for any damages arising from its use.

This project is not officially associated with YouTube. 
```
