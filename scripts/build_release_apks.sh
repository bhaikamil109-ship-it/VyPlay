#!/usr/bin/env bash
#
# Builds the per-ABI release APKs for VyPlay.
#
# The Gradle config already enables ABI splits (see android/app/build.gradle),
# so a plain `flutter build apk --release` produces one APK per architecture
# instead of a single fat one. This script just wraps that with the checks that
# are easy to forget, and prints the resulting sizes.
#
# Usage:  ./scripts/build_release_apks.sh
#
# Requires: Flutter SDK on PATH, and android/key.properties pointing at a
# release keystore (see android/key.properties.example).

set -euo pipefail

cd "$(dirname "$0")/.."

if [ ! -f android/key.properties ]; then
  echo "ERROR: android/key.properties is missing." >&2
  echo "Copy android/key.properties.example and fill in your keystore details." >&2
  exit 1
fi

echo "==> flutter pub get"
flutter pub get

echo "==> flutter analyze"
flutter analyze

echo "==> flutter test"
flutter test

echo "==> building per-ABI release APKs"
flutter build apk --release

echo
echo "==> output (android/app/build/outputs/flutter-apk/)"
ls -lh android/app/build/outputs/flutter-apk/*.apk 2>/dev/null || {
  echo "No APKs found — check the build output above." >&2
  exit 1
}

echo
echo "Done. Upload the arm64-v8a APK for modern devices and the"
echo "armeabi-v7a APK for older 32-bit ones, or use the AAB for Play."
