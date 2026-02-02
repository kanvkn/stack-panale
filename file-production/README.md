# 📱 Stack Mobile - Production Release

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.9+-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart)
![License](https://img.shields.io/badge/License-MIT-green)
![Platform](https://img.shields.io/badge/Platform-Android-blue)
![Version](https://img.shields.io/badge/Version-1.0.0-orange)

**Professional Mobile IDE with AI Integration**

[Download APK](#-download) • [Features](#-features) • [Installation](#-installation)

</div>

---

## 📥 Download

### Latest Release: v1.0.0

**File:** `stack-panale.apk`  
**Size:** ~50 MB  
**Min Android:** 7.0 (API 24)  
**Target Android:** 14 (API 34)

### Direct Download:
```bash
# Download using wget
wget https://github.com/kanvkn/stack-panale/releases/download/v1.0.0/stack-panale.apk

# Or using curl
curl -LO https://github.com/kanvkn/stack-panale/releases/download/v1.0.0/stack-panale.apk
```

---

## ✨ Features

### 🔌 Multiple Connection Modes
- ✅ **Termux** - Connect to Termux on your device
- ✅ **SSH** - Remote server connection
- 🚧 **Local** - Work with local files (coming soon)

### 💻 Advanced Code Editor
- ✅ Syntax highlighting for 20+ languages
- ✅ Multi-tab support
- ✅ Auto-completion
- ✅ Line numbers

### 🖥️ Integrated Terminal
- ✅ Full xterm.js terminal
- ✅ Mobile-optimized keyboard
- ✅ ANSI color support
- ✅ Command history

### 🤖 Nexor AI Assistant
- ✅ Powered by Qwen AI
- ✅ Streaming responses
- ✅ Context-aware suggestions
- ✅ Tool execution

### 🎨 Beautiful UI/UX
- ✅ Material 3 Design
- ✅ Dark & Light themes
- ✅ 10 accent colors
- ✅ Smooth animations

---

## 📱 Installation

### Method 1: Direct Install (Recommended)

1. **Download the APK**
   ```bash
   # Download to your device
   wget https://github.com/kanvkn/stack-panale/releases/download/v1.0.0/stack-panale.apk
   ```

2. **Enable Unknown Sources**
   - Go to Settings → Security
   - Enable "Install from Unknown Sources"

3. **Install**
   - Open the downloaded APK
   - Tap "Install"
   - Wait for installation to complete

4. **Launch**
   - Open Stack Mobile from your app drawer
   - Choose connection mode (SSH/Termux)
   - Start coding!

### Method 2: ADB Install

```bash
# Connect your device via USB
adb devices

# Install the APK
adb install stack-panale.apk

# Launch the app
adb shell am start -n com.example.myapp/.MainActivity
```

---

## 🚀 Quick Start

### For SSH Connection:

1. Launch Stack Mobile
2. Select "SSH" connection mode
3. Enter your server details:
   - Host: `your-server.com`
   - Port: `22`
   - Username: `your-username`
   - Password: `your-password`
4. Tap "Connect"
5. Start coding!

### For Termux Connection:

1. Install [Termux](https://f-droid.org/en/packages/com.termux/)
2. Install [Termux:API](https://f-droid.org/en/packages/com.termux.api/)
3. Launch Stack Mobile
4. Select "Termux" connection mode
5. Tap "Connect"
6. Start coding!

---

## 🔧 Configuration

### AI Assistant Setup:

1. Open Settings (⚙️ icon)
2. Tap "AI Configuration"
3. Tap "Qwen API Key"
4. Enter your API key from [DashScope](https://dashscope.aliyun.com)
5. Tap "Save"

### Theme Customization:

1. Open Settings
2. Toggle Dark/Light mode
3. Choose accent color from 10 options

---

## 📋 Requirements

### Minimum Requirements:
- Android 7.0 (API 24) or higher
- 100 MB free storage
- Internet connection (for SSH/AI features)

### Recommended:
- Android 10+ (API 29)
- 200 MB free storage
- 2GB RAM

### For Termux Mode:
- Termux app installed
- Termux:API addon installed
- Storage permission granted

---

## 🐛 Known Issues

### Fixed in v1.0.0:
- ✅ SSH connection now saves properly
- ✅ Terminal displays correctly
- ✅ File explorer works
- ✅ API key configuration added
- ✅ All permissions included

### Known Limitations:
- ⚠️ Termux command execution is basic (will be improved)
- ⚠️ Local mode not yet implemented
- ⚠️ Passwords stored in SharedPreferences (secure storage coming soon)

---

## 🔒 Permissions

The app requires the following permissions:

- **INTERNET** - For SSH connections and AI features
- **READ/WRITE_EXTERNAL_STORAGE** - For file access
- **READ_MEDIA_*** - For Android 13+ file access
- **RUN_COMMAND** - For Termux integration

All permissions are used only for their stated purposes.

---

## 📊 Changelog

### v1.0.0 (2026-02-02)

#### ✅ Fixed:
- SSH connection saving
- Terminal widget display
- File explorer functionality
- API key configuration
- Android permissions

#### ✨ Added:
- Termux MethodChannel integration
- Settings screen with API key input
- Complete terminal theme
- All required permissions

#### 🎨 Improved:
- UI/UX consistency
- Error handling
- Theme system

---

## 🆘 Troubleshooting

### SSH Connection Fails:
1. Check your internet connection
2. Verify server credentials
3. Ensure port 22 is open
4. Try connecting with another SSH client

### Terminal Not Working:
1. Ensure you're connected (SSH/Termux)
2. Check permissions
3. Restart the app

### AI Not Responding:
1. Check API key in Settings
2. Verify internet connection
3. Ensure API key is valid

### App Crashes:
1. Clear app data
2. Reinstall the app
3. Check Android version compatibility

---

## 🤝 Contributing

Want to contribute? Check out:
- [GitHub Repository](https://github.com/kanvkn/stack-panale)
- [Issues](https://github.com/kanvkn/stack-panale/issues)
- [Pull Requests](https://github.com/kanvkn/stack-panale/pulls)

---

## 📝 License

This project is licensed under the MIT License.

```
MIT License

Copyright (c) 2026 Stack Mobile

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

## 📞 Support

- **GitHub Issues**: [Report a bug](https://github.com/kanvkn/stack-panale/issues)
- **Email**: support@stackmobile.dev
- **Telegram**: @stackmobile

---

## 🙏 Acknowledgments

- [Flutter](https://flutter.dev) - UI framework
- [re_editor](https://pub.dev/packages/re_editor) - Code editor
- [xterm.js](https://xtermjs.org) - Terminal emulator
- [Qwen AI](https://qwenlm.github.io) - AI model
- [Termux](https://termux.dev) - Terminal emulator for Android

---

## 🗺️ Roadmap

### v1.1.0 (Coming Soon):
- [ ] Secure password storage
- [ ] Navigation guards
- [ ] Improved Termux integration
- [ ] Git integration
- [ ] Plugin system

### v1.2.0 (Future):
- [ ] Local file mode
- [ ] Debugging tools
- [ ] Code snippets
- [ ] Collaboration features

---

<div align="center">

**Made with ❤️ using Flutter**

⭐ Star this repo if you find it useful!

[Download APK](https://github.com/kanvkn/stack-panale/releases/download/v1.0.0/stack-panale.apk) • [GitHub](https://github.com/kanvkn/stack-panale) • [Report Issue](https://github.com/kanvkn/stack-panale/issues)

</div>
