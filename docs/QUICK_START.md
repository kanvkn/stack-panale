# ⚡ دليل البدء السريع - Stack Mobile

**الهدف:** إصلاح المشاكل الحرجة في أسرع وقت ممكن

---

## 🎯 الأولويات (بالترتيب)

### 1️⃣ إصلاح SSH Connection (30 دقيقة) ⭐ الأسهل
### 2️⃣ إصلاح Terminal Widget (45 دقيقة) ⭐⭐ سهل
### 3️⃣ إضافة Navigation Guards (20 دقيقة) ⭐ سهل جداً
### 4️⃣ إضافة Permissions (15 دقيقة) ⭐ سهل جداً
### 5️⃣ إصلاح Termux Integration (3 ساعات) ⭐⭐⭐⭐⭐ صعب

**الوقت الإجمالي:** ~5 ساعات

---

## 🚀 الخطوة 1: إصلاح SSH Connection (30 دقيقة)

### الملفات المطلوب تعديلها:
1. `lib/features/setup/presentation/termux_setup_screen.dart`
2. `lib/features/setup/presentation/ssh_setup_screen.dart`

### التعديل:

#### في termux_setup_screen.dart:
```dart
// ابحث عن هذا الكود (السطر ~25):
final provider = ConnectionFactory.create(ConnectionType.termux);
await provider.connect(config);

// استبدله بهذا:
await ref.read(connectionProvider.notifier).connect(config);
ref.read(activeConnectionConfigProvider.notifier).state = config;
```

#### في ssh_setup_screen.dart:
```dart
// ابحث عن هذا الكود (السطر ~55):
final provider = ConnectionFactory.create(ConnectionType.ssh);
await provider.connect(config);

// استبدله بهذا:
await ref.read(connectionProvider.notifier).connect(config);
ref.read(activeConnectionConfigProvider.notifier).state = config;
```

### اختبار:
```bash
flutter run
# جرب الاتصال بـ SSH
# يجب أن تنتقل إلى IDE بنجاح
```

---

## 🚀 الخطوة 2: إصلاح Terminal Widget (45 دقيقة)

### الملف المطلوب تعديله:
`lib/features/setup/presentation/terminal_widget.dart`

### التعديل:

استبدل الـ `build` method بالكامل:

```dart
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
```

### إضافة import:
```dart
import 'package:xterm/flutter.dart';
```

### اختبار:
```bash
flutter run
# اضغط على أيقونة Terminal في IDE
# يجب أن يظهر Terminal بشكل صحيح
```

---

## 🚀 الخطوة 3: إضافة Navigation Guards (20 دقيقة)

### الملف المطلوب تعديله:
`lib/shared/utils/router.dart`

### التعديل:

استبدل `AppRouter` class بالكامل:

```dart
class AppRouter {
  static GoRouter router(WidgetRef ref) {
    return GoRouter(
      initialLocation: '/setup',
      redirect: (context, state) {
        final connectionState = ref.read(connectionProvider).state;
        final isConnected = connectionState == ConnectionState.connected;
        
        if ((state.location.startsWith('/ide') || 
             state.location.startsWith('/nexor') || 
             state.location.startsWith('/nexi')) && !isConnected) {
          return '/setup';
        }
        
        return null;
      },
      routes: [
        // ... نفس الـ routes الموجودة
      ],
    );
  }
}
```

### تحديث main.dart:
```dart
@override
Widget build(BuildContext context, WidgetRef ref) {
  final themeMode = ref.watch(themeProvider);

  return MaterialApp.router(
    title: 'Stack Mobile',
    debugShowCheckedModeBanner: false,
    theme: AppTheme.lightTheme(),
    darkTheme: AppTheme.darkTheme(),
    themeMode: themeMode,
    routerConfig: AppRouter.router(ref), // ✅ تمرير ref
  );
}
```

### اختبار:
```bash
flutter run
# حاول الوصول إلى /ide بدون اتصال
# يجب أن يعيد توجيهك إلى /setup
```

---

## 🚀 الخطوة 4: إضافة Permissions (15 دقيقة)

### الملف المطلوب تعديله:
`android/app/src/main/AndroidManifest.xml`

### التعديل:

أضف هذه الـ permissions قبل `<application>`:

```xml
<!-- Internet for SSH -->
<uses-permission android:name="android.permission.INTERNET" />

<!-- Storage for file access -->
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />

<!-- For Android 13+ -->
<uses-permission android:name="android.permission.READ_MEDIA_IMAGES" />
<uses-permission android:name="android.permission.READ_MEDIA_VIDEO" />
<uses-permission android:name="android.permission.READ_MEDIA_AUDIO" />

<!-- Termux integration -->
<uses-permission android:name="com.termux.permission.RUN_COMMAND" />
```

أضف هذا قبل `</manifest>`:

```xml
<queries>
    <package android:name="com.termux" />
    <package android:name="com.termux.api" />
    <intent>
        <action android:name="android.intent.action.PROCESS_TEXT"/>
        <data android:mimeType="text/plain"/>
    </intent>
</queries>
```

### اختبار:
```bash
flutter clean
flutter run
# يجب أن يعمل SSH بدون مشاكل permissions
```

---

## 🚀 الخطوة 5: إصلاح Termux Integration (3 ساعات)

### ⚠️ هذه الخطوة معقدة - اقرأ [SOLUTIONS.md](./SOLUTIONS.md#الحل-1) للتفاصيل الكاملة

### الملفات المطلوب تعديلها:
1. `android/app/src/main/kotlin/com/example/myapp/MainActivity.kt`
2. `android/app/build.gradle.kts`
3. تغيير package name في كل المشروع

### الخطوات المختصرة:

#### 1. تحديث MainActivity.kt:
```kotlin
package com.stackmobile.app

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.stackmobile/termux"
    
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "checkTermuxAPI" -> {
                        result.success(isPackageInstalled("com.termux.api"))
                    }
                    "executeCommand" -> {
                        val command = call.argument<String>("command")
                        executeTermuxCommand(command, result)
                    }
                    // ... باقي الـ methods
                    else -> result.notImplemented()
                }
            }
    }
    
    // ... باقي الـ implementation
}
```

#### 2. تحديث build.gradle.kts:
```kotlin
android {
    namespace = "com.stackmobile.app"
    defaultConfig {
        applicationId = "com.stackmobile.app"
        // ...
    }
}
```

#### 3. تغيير package name:
```bash
# انقل الملفات
mv android/app/src/main/kotlin/com/example/myapp \
   android/app/src/main/kotlin/com/stackmobile/app
```

### اختبار:
```bash
flutter clean
flutter run
# جرب الاتصال بـ Termux
# يجب أن يعمل بنجاح
```

---

## ✅ Checklist

بعد إكمال كل خطوة، ضع علامة ✅:

- [ ] الخطوة 1: إصلاح SSH Connection
- [ ] الخطوة 2: إصلاح Terminal Widget
- [ ] الخطوة 3: إضافة Navigation Guards
- [ ] الخطوة 4: إضافة Permissions
- [ ] الخطوة 5: إصلاح Termux Integration

---

## 🎯 بعد الانتهاء

### اختبار شامل:
```bash
# 1. نظف المشروع
flutter clean

# 2. احصل على dependencies
flutter pub get

# 3. شغل التطبيق
flutter run

# 4. اختبر كل feature:
# - SSH connection ✅
# - Terminal ✅
# - File explorer ✅
# - Navigation guards ✅
```

### الخطوات التالية:
1. اقرأ [CRITICAL_ISSUES.md](./CRITICAL_ISSUES.md) للمشاكل المتبقية
2. اقرأ [SOLUTIONS.md](./SOLUTIONS.md) للحلول التفصيلية
3. ابدأ في المرحلة 2 من خارطة الطريق

---

## 🆘 إذا واجهت مشكلة

### مشكلة في SSH:
```dart
// تأكد من أن connectionProvider يحفظ الاتصال
final provider = ref.read(connectionProvider.notifier).provider;
print('Provider: $provider'); // يجب أن لا يكون null
```

### مشكلة في Terminal:
```dart
// تأكد من import xterm/flutter
import 'package:xterm/flutter.dart';
```

### مشكلة في Navigation:
```dart
// تأكد من تمرير ref إلى router
routerConfig: AppRouter.router(ref),
```

### مشكلة في Permissions:
```bash
# تأكد من أن AndroidManifest صحيح
cat android/app/src/main/AndroidManifest.xml
```

---

## 📞 الدعم

إذا واجهت أي مشكلة:
1. راجع [SOLUTIONS.md](./SOLUTIONS.md) للتفاصيل الكاملة
2. ابحث في [CRITICAL_ISSUES.md](./CRITICAL_ISSUES.md)
3. أنشئ issue في GitHub

---

**وقت القراءة:** 10 دقائق  
**وقت التنفيذ:** 5 ساعات  
**الصعوبة:** متوسطة

**حظاً موفقاً! 🚀**
