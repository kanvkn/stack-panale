# 🔨 Build Instructions

## How to Build the APK

### Prerequisites:
- Flutter SDK installed
- Android SDK installed
- All dependencies installed (`flutter pub get`)

### Build Command:

```bash
# Navigate to project root
cd /home/user/myapp

# Clean previous builds
flutter clean

# Get dependencies
flutter pub get

# Build release APK
flutter build apk --release

# The APK will be at:
# build/app/outputs/flutter-apk/app-release.apk
```

### Copy to Production:

```bash
# Copy the built APK to file-production
cp build/app/outputs/flutter-apk/app-release.apk file-production/stack-panale.apk

# Check file size
ls -lh file-production/stack-panale.apk
```

### Build Split APKs (Smaller Size):

```bash
# Build split APKs per ABI
flutter build apk --split-per-abi --release

# This creates:
# - app-armeabi-v7a-release.apk (32-bit ARM)
# - app-arm64-v8a-release.apk (64-bit ARM)
# - app-x86_64-release.apk (64-bit x86)
```

### Build App Bundle (For Play Store):

```bash
# Build AAB for Google Play
flutter build appbundle --release

# The bundle will be at:
# build/app/outputs/bundle/release/app-release.aab
```

---

## Current Status:

⚠️ **The APK file is currently a placeholder.**

To build the actual APK:
1. Run the build commands above
2. Copy the APK to this directory
3. Commit and push to repository

---

**Last Updated:** 2026-02-02
