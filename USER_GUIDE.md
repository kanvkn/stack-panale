# Stack Mobile - User Guide

## Getting Started

### Installation

1. **Install Flutter SDK**
   ```bash
   # Follow instructions at https://flutter.dev/docs/get-started/install
   ```

2. **Clone and Setup**
   ```bash
   git clone <repository-url>
   cd myapp
   flutter pub get
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

3. **Run the App**
   ```bash
   flutter run
   ```

## First Time Setup

### Choosing Connection Mode

When you first launch Stack Mobile, you'll see three connection options:

1. **Termux** - Connect to Termux on your Android device
2. **SSH** - Connect to a remote server via SSH
3. **Local** - Work with local files (limited, under development)

### Termux Setup

**Requirements:**
- Termux app installed
- Termux:API addon installed
- Storage permission granted

**Steps:**
1. Select "Termux" from setup screen
2. Grant required permissions
3. Tap "Connect"

### SSH Setup

**Requirements:**
- SSH server access
- Host address and credentials

**Steps:**
1. Select "SSH" from setup screen
2. Enter host address (e.g., example.com or 192.168.1.1)
3. Enter port (default: 22)
4. Enter username
5. Enter password
6. Tap "Connect"

## Using the IDE

### File Explorer

**Navigate Files:**
- Tap folders to expand/collapse
- Tap files to open in editor
- Use back button to go up one level
- Tap refresh to reload directory

**File Icons:**
- 📁 Folder
- 📄 Generic file
- 💻 Code files (Dart, JS, Python, etc.)
- 📊 JSON files
- 📝 Markdown files
- 🖼️ Image files

### Code Editor

**Opening Files:**
- Tap any file in the explorer
- File opens in a new tab

**Editing:**
- Type to edit code
- Syntax highlighting automatic
- Changes marked with • (dirty indicator)

**Tabs:**
- Multiple files can be open
- Tap tab to switch
- Tap X to close tab
- Swipe to close (mobile)

**Floating Windows:**
- Long press tab to detach
- Drag window to move
- Drag corner to resize
- Tap minimize to dock
- Tap close to remove

### Terminal

**Opening Terminal:**
- Tap terminal icon in toolbar
- Terminal appears at bottom

**Using Terminal:**
- Type commands and press Enter
- Output appears in real-time
- Scroll to see history

**Closing Terminal:**
- Tap terminal icon again to hide

## Using Nexor AI

### Opening Nexor

- Tap AI icon (🤖) in IDE toolbar
- Or navigate to Nexor from menu

### Chatting with AI

1. Type your question or request
2. Tap send button
3. AI responds with answer
4. Continue conversation

### Using Tools

Nexor can:
- Read files: "Show me the content of app.dart"
- List files: "What files are in the lib folder?"
- Write files: "Create a new file called test.dart"
- Run commands: "Run flutter analyze"

### Selecting an Agent

1. Tap Apps icon in Nexor
2. Browse available agents
3. Tap agent to select
4. Agent's system prompt activates
5. Chat with specialized agent

## Nexi Agents

### Available Agents

**Code Review** 🔍
- Analyzes code quality
- Identifies bugs
- Suggests improvements
- Reviews architecture

**Debug Assistant** 🐛
- Helps find bugs
- Analyzes errors
- Suggests fixes
- Explains issues

**Doc Writer** 📝
- Generates documentation
- Writes README files
- Creates API docs
- Adds code comments

### Using Agents

1. Open Nexi Marketplace
2. Select an agent
3. Return to Nexor
4. Agent name appears in header
5. Chat uses agent's expertise

### Clearing Agent

- Tap X next to agent name
- Returns to default Nexor mode

## Settings

### Accessing Settings

- Tap settings icon (⚙️) in IDE
- Or navigate from menu

### Theme Settings

**Dark Mode:**
- Toggle dark/light theme
- Changes apply immediately

**Accent Color:**
- Tap "Accent Color"
- Choose from 10 colors
- UI updates with new color

### AI Configuration

**Qwen API Key:**
- Required for AI features
- Get key from Alibaba Cloud
- Enter in settings
- Saved securely

## Tips & Tricks

### Keyboard Shortcuts

- **Ctrl/Cmd + S** - Save file (coming soon)
- **Ctrl/Cmd + K** - Inline edit (coming soon)
- **Enter** - Send message in chat

### Gestures

- **Long press** - Context menu (coming soon)
- **Swipe** - Close tab
- **Pinch** - Zoom (coming soon)
- **Drag** - Move floating windows

### Performance

- Close unused tabs
- Clear chat history periodically
- Restart app if slow
- Keep files under 10K lines for best performance

### Best Practices

- Save work frequently
- Use descriptive file names
- Organize files in folders
- Use AI for complex tasks
- Select appropriate agent for task

## Troubleshooting

### Connection Issues

**Termux not connecting:**
- Ensure Termux:API installed
- Grant storage permission
- Restart Termux
- Restart app

**SSH not connecting:**
- Check host address
- Verify port number
- Confirm credentials
- Check network connection

### Editor Issues

**File not opening:**
- Check file permissions
- Verify file exists
- Try refreshing explorer
- Restart app

**Syntax highlighting not working:**
- Check file extension
- Supported: .dart, .js, .py, .json, .md
- Restart app if needed

### AI Issues

**AI not responding:**
- Check API key configured
- Verify internet connection
- Check API quota
- Try again later

**Tools not working:**
- Ensure connected to server
- Check file paths
- Verify permissions
- Check error message

### Performance Issues

**App slow:**
- Close unused tabs
- Clear chat history
- Restart app
- Check device storage

**Editor laggy:**
- Reduce file size
- Close other apps
- Restart device
- Update app

## FAQ

**Q: Is my data secure?**
A: Yes. Credentials stored locally, encrypted. No data sent to external servers except AI provider.

**Q: Can I use without internet?**
A: Yes, except AI features require internet.

**Q: Which languages are supported?**
A: Dart, JavaScript, TypeScript, Python, JSON, Markdown, and more.

**Q: Can I customize the theme?**
A: Yes, dark/light mode and 10 accent colors available.

**Q: How do I add custom agents?**
A: See CREATING_AGENTS.md for developer guide.

**Q: Is it free?**
A: App is free. Qwen AI requires API key (may have costs).

**Q: Can I use on tablet?**
A: Yes, responsive design works on tablets.

**Q: How do I report bugs?**
A: Open issue on GitHub or contact support.

## Support

- **Documentation**: See ARCHITECTURE.md
- **Issues**: GitHub Issues
- **Email**: support@stackmobile.dev (example)
- **Community**: Discord/Slack (coming soon)

## Updates

Check for updates regularly:
- New features
- Bug fixes
- Performance improvements
- New agents

## Credits

Built with:
- Flutter & Dart
- Riverpod
- re_editor
- xterm
- And many more amazing packages

---

**Happy Coding! 🚀**
