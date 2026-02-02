# 📱 Stack Mobile

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.9+-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart)
![License](https://img.shields.io/badge/License-MIT-green)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20Web-blue)

**Professional Mobile IDE with AI Integration**

[Download APK](https://github.com/kanvkn/stack-panale/releases) • [Documentation](#features) • [Screenshots](#screenshots)

</div>

---

## ✨ Features

### 🔌 **Multiple Connection Modes**
- **Termux**: Connect to Termux on your Android device
- **SSH**: Remote server connection via SSH
- **Local**: Work with local files (coming soon)

### 💻 **Advanced Code Editor**
- Syntax highlighting for 20+ languages
- Multi-tab support with state persistence
- Floating windows (drag, resize, minimize)
- Auto-completion and code formatting
- Line numbers and code folding

### 🖥️ **Integrated Terminal**
- Full xterm.js terminal emulator
- Mobile-optimized keyboard
- Split view with editor
- Command history and shortcuts

### 🤖 **Nexor AI Assistant**
- Powered by Qwen AI
- Streaming responses
- Context-aware suggestions
- Tool execution (read/write files, execute commands)
- Smart memory system

### 🎯 **Nexi Agent System**
- **Code Review Agent**: Analyze code quality and suggest improvements
- **Debug Assistant**: Help find and fix bugs
- **Documentation Writer**: Generate comprehensive docs
- Extensible plugin architecture

### 🎨 **Beautiful UI/UX**
- Material 3 Design
- Dark & Light themes
- 10 accent colors to choose from
- Smooth animations
- Responsive layout

---

## 📥 Installation

### Android
1. Download the latest APK from [Releases](https://github.com/kanvkn/stack-panale/releases)
2. Enable "Install from Unknown Sources" in Settings
3. Install and launch the app

### Web
Visit: [https://stack-mobile.web.app](https://stack-mobile.web.app) *(coming soon)*

### Build from Source
```bash
# Clone the repository
git clone https://github.com/kanvkn/stack-panale.git
cd stack-panale

# Install dependencies
flutter pub get

# Run code generation
flutter pub run build_runner build --delete-conflicting-outputs

# Build APK
flutter build apk --release

# Or run on device
flutter run
```

---

## 🚀 Quick Start

1. **Launch the app**
2. **Choose connection mode**:
   - For Termux: Ensure Termux is installed and running
   - For SSH: Enter your server credentials
3. **Start coding!**
   - Browse files in the explorer
   - Open files in the editor
   - Use the terminal for commands
   - Ask Nexor AI for help

---

## 🏗️ Architecture

Built with **Clean Architecture + DDD-lite** principles:

```
lib/
├── core/              # Core business logic
│   ├── domain/        # Entities, Use Cases, Repositories
│   └── infrastructure/# Implementations
├── features/          # Feature modules
│   ├── setup/         # Connection setup
│   ├── ide/           # Code editor
│   ├── nexor/         # AI assistant
│   ├── nexi/          # Agent system
│   └── terminal/      # Terminal
└── shared/            # Shared resources
    ├── theme/         # Theme system
    ├── widgets/       # Reusable widgets
    └── utils/         # Utilities
```

### Design Patterns
- **Strategy Pattern**: Connection providers
- **Repository Pattern**: Data access
- **Provider Pattern**: Dependency injection (Riverpod)
- **Factory Pattern**: Connection creation
- **Registry Pattern**: Nexi agents

---

## 🛠️ Tech Stack

| Category | Technology |
|----------|-----------|
| **Framework** | Flutter 3.9+ |
| **Language** | Dart 3.0+ |
| **State Management** | Riverpod 2.5+ |
| **Code Editor** | re_editor 0.8+ |
| **Terminal** | xterm 4.0+ |
| **Networking** | dio 5.4+, dartssh2 2.13+ |
| **Routing** | go_router 14.2+ |
| **UI** | Material 3, flutter_animate |

---

## 📸 Screenshots

<div align="center">

| Setup Screen | Code Editor | Terminal |
|-------------|-------------|----------|
| ![Setup](screenshots/setup.png) | ![Editor](screenshots/editor.png) | ![Terminal](screenshots/terminal.png) |

| Nexor AI | Nexi Agents | Settings |
|----------|-------------|----------|
| ![Nexor](screenshots/nexor.png) | ![Nexi](screenshots/nexi.png) | ![Settings](screenshots/settings.png) |

</div>

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- [Flutter](https://flutter.dev) - UI framework
- [re_editor](https://pub.dev/packages/re_editor) - Code editor
- [xterm.js](https://xtermjs.org) - Terminal emulator
- [Qwen AI](https://qwenlm.github.io) - AI model

---

## 📧 Contact

- **GitHub**: [@kanvkn](https://github.com/kanvkn)
- **Issues**: [Report a bug](https://github.com/kanvkn/stack-panale/issues)

---

<div align="center">

**Made with ❤️ using Flutter**

⭐ Star this repo if you find it useful!

</div>
