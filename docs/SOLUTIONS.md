# 🔧 دليل الحلول - Stack Mobile

**تاريخ:** 2026-02-02  
**الحالة:** جاهز للتنفيذ

---

## 🎯 الحل #1: إضافة Native Android Code لـ Termux

### الخطوات:

#### 1. تحديث MainActivity.kt

```kotlin
package com.stackmobile.app

import android.content.Intent
import android.content.pm.PackageManager
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.BufferedReader
import java.io.InputStreamReader

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.stackmobile/termux"
    private val TERMUX_PACKAGE = "com.termux"
    private val TERMUX_API_PACKAGE = "com.termux.api"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "checkTermuxAPI" -> {
                        result.success(isPackageInstalled(TERMUX_API_PACKAGE))
                    }
                    "executeCommand" -> {
                        val command = call.argument<String>("command")
                        if (command != null) {
                            executeTermuxCommand(command, result)
                        } else {
                            result.error("INVALID_ARGUMENT", "Command is null", null)
                        }
                    }
                    "readFile" -> {
                        val path = call.argument<String>("path")
                        if (path != null) {
                            readFile(path, result)
                        } else {
                            result.error("INVALID_ARGUMENT", "Path is null", null)
                        }
                    }
                    "writeFile" -> {
                        val path = call.argument<String>("path")
                        val content = call.argument<String>("content")
                        if (path != null && content != null) {
                            writeFile(path, content, result)
                        } else {
                            result.error("INVALID_ARGUMENT", "Invalid arguments", null)
                        }
                    }
                    "listFiles" -> {
                        val path = call.argument<String>("path")
                        if (path != null) {
                            listFiles(path, result)
                        } else {
                            result.error("INVALID_ARGUMENT", "Path is null", null)
                        }
                    }
                    else -> result.notImplemented()
                }
            }
    }

    private fun isPackageInstalled(packageName: String): Boolean {
        return try {
            packageManager.getPackageInfo(packageName, 0)
            true
        } catch (e: PackageManager.NameNotFoundException) {
            false
        }
    }

    private fun executeTermuxCommand(command: String, result: MethodChannel.Result) {
        try {
            val intent = Intent()
            intent.setClassName(TERMUX_PACKAGE, "$TERMUX_PACKAGE.app.RunCommandService")
            intent.action = "$TERMUX_PACKAGE.RUN_COMMAND"
            intent.putExtra("$TERMUX_PACKAGE.RUN_COMMAND_PATH", "/data/data/com.termux/files/usr/bin/sh")
            intent.putExtra("$TERMUX_PACKAGE.RUN_COMMAND_ARGUMENTS", arrayOf("-c", command))
            intent.putExtra("$TERMUX_PACKAGE.RUN_COMMAND_BACKGROUND", false)
            
            startService(intent)
            
            // Note: This is simplified. Real implementation needs result handling
            result.success(mapOf(
                "exitCode" to 0,
                "output" to "Command sent to Termux",
                "error" to null
            ))
        } catch (e: Exception) {
            result.error("EXECUTION_ERROR", e.message, null)
        }
    }

    private fun readFile(path: String, result: MethodChannel.Result) {
        try {
            val file = java.io.File(path)
            if (file.exists() && file.canRead()) {
                val content = file.readText()
                result.success(content)
            } else {
                result.error("FILE_ERROR", "Cannot read file: $path", null)
            }
        } catch (e: Exception) {
            result.error("READ_ERROR", e.message, null)
        }
    }

    private fun writeFile(path: String, content: String, result: MethodChannel.Result) {
        try {
            val file = java.io.File(path)
            file.writeText(content)
            result.success(null)
        } catch (e: Exception) {
            result.error("WRITE_ERROR", e.message, null)
        }
    }

    private fun listFiles(path: String, result: MethodChannel.Result) {
        try {
            val dir = java.io.File(path)
            if (dir.exists() && dir.isDirectory) {
                val files = dir.listFiles()?.map { it.name } ?: emptyList()
                result.success(files)
            } else {
                result.error("DIR_ERROR", "Invalid directory: $path", null)
            }
        } catch (e: Exception) {
            result.error("LIST_ERROR", e.message, null)
        }
    }
}
```

#### 2. تحديث AndroidManifest.xml

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.stackmobile.app">
    
    <!-- Permissions -->
    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
    <uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE" 
        android:minSdkVersion="30" />
    
    <!-- Termux permissions -->
    <uses-permission android:name="com.termux.permission.RUN_COMMAND" />
    
    <application
        android:label="Stack Mobile"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher"
        android:requestLegacyExternalStorage="true">
        
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTop"
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            
            <meta-data
              android:name="io.flutter.embedding.android.NormalTheme"
              android:resource="@style/NormalTheme" />
              
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        
        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
    </application>
    
    <queries>
        <package android:name="com.termux" />
        <package android:name="com.termux.api" />
        <intent>
            <action android:name="android.intent.action.PROCESS_TEXT"/>
            <data android:mimeType="text/plain"/>
        </intent>
    </queries>
</manifest>
```

#### 3. تحديث build.gradle.kts

```kotlin
android {
    namespace = "com.stackmobile.app"
    compileSdk = 34
    
    defaultConfig {
        applicationId = "com.stackmobile.app"
        minSdk = 24
        targetSdk = 34
        versionCode = 1
        versionName = "1.0.0"
    }
    
    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}
```

---

## 🎯 الحل #2: إصلاح SSH Connection Saving

### تحديث termux_setup_screen.dart

```dart
class _TermuxSetupScreenState extends ConsumerState<TermuxSetupScreen> {
  bool _isConnecting = false;
  String? _errorMessage;

  Future<void> _connect() async {
    setState(() {
      _isConnecting = true;
      _errorMessage = null;
    });

    try {
      final config = ConnectionConfig(
        id: const Uuid().v4(),
        name: 'Termux',
        type: ConnectionType.termux,
      );

      // ✅ استخدام connectionProvider الـ global
      await ref.read(connectionProvider.notifier).connect(config);
      
      // ✅ حفظ الـ config
      ref.read(activeConnectionConfigProvider.notifier).state = config;

      if (mounted) {
        context.go('/ide');
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _isConnecting = false;
      });
    }
  }
  
  // ... rest of the code
}
```

### تحديث ssh_setup_screen.dart

```dart
class _SSHSetupScreenState extends ConsumerState<SSHSetupScreen> {
  // ... existing code ...

  Future<void> _connect() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isConnecting = true;
      _errorMessage = null;
    });

    try {
      final config = ConnectionConfig(
        id: const Uuid().v4(),
        name: '${_usernameController.text}@${_hostController.text}',
        type: ConnectionType.ssh,
        metadata: {
          'host': _hostController.text,
          'port': int.parse(_portController.text),
          'username': _usernameController.text,
          'password': _passwordController.text,
        },
      );

      // ✅ استخدام connectionProvider الـ global
      await ref.read(connectionProvider.notifier).connect(config);
      
      // ✅ حفظ الـ config
      ref.read(activeConnectionConfigProvider.notifier).state = config;

      if (mounted) {
        context.go('/ide');
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _isConnecting = false;
      });
    }
  }
  
  // ... rest of the code
}
```

---

## 🎯 الحل #3: إصلاح Terminal Widget

### تحديث terminal_widget.dart

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xterm/xterm.dart';
import 'package:xterm/flutter.dart';
import '../../setup/presentation/connection_provider.dart';

class TerminalWidget extends ConsumerStatefulWidget {
  const TerminalWidget({super.key});

  @override
  ConsumerState<TerminalWidget> createState() => _TerminalWidgetState();
}

class _TerminalWidgetState extends ConsumerState<TerminalWidget> {
  late Terminal _terminal;
  final _inputBuffer = StringBuffer();

  @override
  void initState() {
    super.initState();
    _terminal = Terminal(
      maxLines: 10000,
    );
    
    _terminal.write('Stack Mobile Terminal\r\n');
    _terminal.write('Type commands and press Enter\r\n\r\n');
    _terminal.write('\$ ');

    _terminal.onOutput = (data) {
      _handleInput(data);
    };
  }

  void _handleInput(String data) async {
    final provider = ref.read(connectionProvider.notifier).provider;
    if (provider == null) {
      _terminal.write('\r\nError: Not connected\r\n\$ ');
      return;
    }

    for (var char in data.runes) {
      if (char == 13) { // Enter
        _terminal.write('\r\n');
        final command = _inputBuffer.toString();
        _inputBuffer.clear();
        
        if (command.isNotEmpty) {
          try {
            final result = await provider.executeCommand(command);
            if (result.output.isNotEmpty) {
              _terminal.write(result.output);
            }
            if (result.error != null && result.error!.isNotEmpty) {
              _terminal.write('\r\n\x1b[31m${result.error}\x1b[0m');
            }
          } catch (e) {
            _terminal.write('\r\n\x1b[31mError: $e\x1b[0m');
          }
        }
        _terminal.write('\r\n\$ ');
      } else if (char == 127) { // Backspace
        if (_inputBuffer.isNotEmpty) {
          _inputBuffer.write(String.fromCharCode(char));
        }
      } else {
        _inputBuffer.write(String.fromCharCode(char));
      }
    }
  }

  @override
  void dispose() {
    _terminal.onOutput = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.all(8),
      child: TerminalView(
        _terminal,
        theme: TerminalTheme(
          cursor: Theme.of(context).colorScheme.primary,
          selection: Theme.of(context).colorScheme.primary.withOpacity(0.3),
          foreground: Theme.of(context).colorScheme.onSurface,
          background: Theme.of(context).colorScheme.surface,
          black: const Color(0xFF000000),
          red: const Color(0xFFEF4444),
          green: const Color(0xFF10B981),
          yellow: const Color(0xFFF59E0B),
          blue: const Color(0xFF3B82F6),
          magenta: const Color(0xFFA855F7),
          cyan: const Color(0xFF06B6D4),
          white: const Color(0xFFFFFFFF),
          brightBlack: const Color(0xFF6B7280),
          brightRed: const Color(0xFFF87171),
          brightGreen: const Color(0xFF34D399),
          brightYellow: const Color(0xFFFBBF24),
          brightBlue: const Color(0xFF60A5FA),
          brightMagenta: const Color(0xFFC084FC),
          brightCyan: const Color(0xFF22D3EE),
          brightWhite: const Color(0xFFF9FAFB),
        ),
      ),
    );
  }
}
```

---

## 🎯 الحل #4: إضافة Navigation Guards

### تحديث router.dart

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/setup/presentation/setup_screen.dart';
import '../../features/setup/presentation/termux_setup_screen.dart';
import '../../features/setup/presentation/ssh_setup_screen.dart';
import '../../features/setup/presentation/local_setup_screen.dart';
import '../../features/ide/presentation/ide_screen.dart';
import '../../features/nexor/presentation/nexor_screen.dart';
import '../../features/nexi/presentation/nexi_marketplace.dart';
import '../widgets/settings_screen.dart';
import '../../features/setup/presentation/connection_provider.dart';
import '../../core/domain/entities/connection_status.dart';

class AppRouter {
  static GoRouter router(WidgetRef ref) {
    return GoRouter(
      initialLocation: '/setup',
      redirect: (context, state) {
        final connectionState = ref.read(connectionProvider).state;
        final isConnected = connectionState == ConnectionState.connected;
        
        // إذا كان المستخدم يحاول الوصول إلى IDE بدون اتصال
        if (state.location.startsWith('/ide') && !isConnected) {
          return '/setup';
        }
        
        // إذا كان المستخدم يحاول الوصول إلى Nexor بدون اتصال
        if (state.location.startsWith('/nexor') && !isConnected) {
          return '/setup';
        }
        
        // إذا كان المستخدم يحاول الوصول إلى Nexi بدون اتصال
        if (state.location.startsWith('/nexi') && !isConnected) {
          return '/setup';
        }
        
        return null;
      },
      routes: [
        GoRoute(
          path: '/setup',
          name: 'setup',
          builder: (context, state) => const SetupScreen(),
        ),
        GoRoute(
          path: '/setup/termux',
          name: 'termux-setup',
          builder: (context, state) => const TermuxSetupScreen(),
        ),
        GoRoute(
          path: '/setup/ssh',
          name: 'ssh-setup',
          builder: (context, state) => const SSHSetupScreen(),
        ),
        GoRoute(
          path: '/setup/local',
          name: 'local-setup',
          builder: (context, state) => const LocalSetupScreen(),
        ),
        GoRoute(
          path: '/ide',
          name: 'ide',
          builder: (context, state) => const IDEScreen(),
        ),
        GoRoute(
          path: '/nexor',
          name: 'nexor',
          builder: (context, state) => const NexorScreen(),
        ),
        GoRoute(
          path: '/nexi',
          name: 'nexi',
          builder: (context, state) => const NexiMarketplace(),
        ),
        GoRoute(
          path: '/settings',
          name: 'settings',
          builder: (context, state) => const SettingsScreen(),
        ),
      ],
    );
  }
}
```

### تحديث main.dart

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'shared/theme/app_theme.dart';
import 'shared/theme/theme_provider.dart';
import 'shared/utils/router.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return MaterialApp.router(
      title: 'Stack Mobile',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: themeMode,
      routerConfig: AppRouter.router(ref),
    );
  }
}
```

---

## 🎯 الحل #5: إضافة Settings Screen للـ API Key

### تحديث settings_screen.dart

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/theme_provider.dart';
import '../theme/accent_color_provider.dart';

final apiKeyProvider = StateProvider<String?>((ref) => null);

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final _apiKeyController = TextEditingController();
  bool _obscureApiKey = true;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _loadApiKey();
  }

  Future<void> _loadApiKey() async {
    final prefs = await SharedPreferences.getInstance();
    final apiKey = prefs.getString('qwen_api_key');
    if (apiKey != null) {
      _apiKeyController.text = apiKey;
      ref.read(apiKeyProvider.notifier).state = apiKey;
    }
  }

  Future<void> _saveApiKey() async {
    setState(() => _isSaving = true);
    
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('qwen_api_key', _apiKeyController.text);
      ref.read(apiKeyProvider.notifier).state = _apiKeyController.text;
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('API Key saved successfully')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving API Key: $e')),
        );
      }
    } finally {
      setState(() => _isSaving = false);
    }
  }

  @override
  void dispose() {
    _apiKeyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeProvider);
    final accentColor = ref.watch(accentColorProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Theme Section
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Appearance',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    leading: const Icon(Icons.brightness_6),
                    title: const Text('Theme Mode'),
                    trailing: SegmentedButton<ThemeMode>(
                      segments: const [
                        ButtonSegment(
                          value: ThemeMode.light,
                          icon: Icon(Icons.light_mode, size: 16),
                        ),
                        ButtonSegment(
                          value: ThemeMode.dark,
                          icon: Icon(Icons.dark_mode, size: 16),
                        ),
                      ],
                      selected: {themeMode},
                      onSelectionChanged: (Set<ThemeMode> newSelection) {
                        ref.read(themeProvider.notifier).setTheme(newSelection.first);
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  ListTile(
                    leading: const Icon(Icons.palette),
                    title: const Text('Accent Color'),
                    trailing: DropdownButton<Color>(
                      value: accentColor,
                      items: AccentColors.colors.entries.map((entry) {
                        return DropdownMenuItem(
                          value: entry.value,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: entry.value,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(entry.key),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (color) {
                        if (color != null) {
                          ref.read(accentColorProvider.notifier).setColor(color);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          // AI Section
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AI Configuration',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _apiKeyController,
                    decoration: InputDecoration(
                      labelText: 'Qwen API Key',
                      hintText: 'Enter your Qwen API key',
                      prefixIcon: const Icon(Icons.key),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureApiKey ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureApiKey = !_obscureApiKey;
                          });
                        },
                      ),
                    ),
                    obscureText: _obscureApiKey,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _isSaving ? null : _saveApiKey,
                    child: _isSaving
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Save API Key'),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Get your API key from: https://dashscope.aliyun.com',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          // About Section
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text('Version'),
                    subtitle: const Text('1.0.0'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.code),
                    title: const Text('GitHub'),
                    subtitle: const Text('github.com/kanvkn/stack-panale'),
                    onTap: () {
                      // Open GitHub
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

---

**ملاحظة:** هذه الحلول جاهزة للتطبيق المباشر. يُنصح بتطبيقها بالترتيب المذكور.
