# 🔴 Stack Mobile - تقرير المشاكل الحرجة

**تاريخ التقرير:** 2026-02-02  
**حالة المشروع:** يحتوي على مشاكل حرجة تمنع الاستخدام الأساسي

---

## 📋 ملخص تنفيذي

تم فحص المشروع بعمق ووجدنا **7 مشاكل حرجة** و **12 مشكلة متوسطة** و **8 تحسينات مطلوبة**.

### المشاكل الرئيسية:
1. ❌ **عدم القدرة على تسجيل الدخول عبر Termux أو SSH** (حرج)
2. ❌ **عدم وجود Native Code لـ Termux** (حرج)
3. ❌ **مشاكل في SSH Connection** (حرج)
4. ⚠️ **Terminal غير مكتمل** (متوسط)
5. ⚠️ **Nexor AI غير مهيأ** (متوسط)

---

## 🔥 المشاكل الحرجة (Critical Issues)

### 1. ❌ عدم وجود Native Android Code لـ Termux
**الحالة:** 🔴 لم يتم الحل  
**الأولوية:** حرجة جداً  
**التأثير:** يمنع استخدام وضع Termux بالكامل

#### الوصف:
ملف `MainActivity.kt` فارغ تماماً ولا يحتوي على أي `MethodChannel` للتواصل مع Termux.

#### الملف الحالي:
```kotlin
// android/app/src/main/kotlin/com/example/myapp/MainActivity.kt
package com.example.myapp

import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity()
```

#### المشكلة:
- الكود في `TermuxConnectionProvider` يحاول استدعاء `platform.invokeMethod('checkTermuxAPI')` لكن لا يوجد handler في الجانب الأندرويد
- لا توجد أي permissions في `AndroidManifest.xml` للوصول إلى Termux
- لا يوجد integration مع Termux:API

#### الحل المطلوب:
1. إضافة MethodChannel في MainActivity
2. إضافة permissions للوصول إلى Termux
3. إضافة Intent handling للتواصل مع Termux:API
4. إضافة error handling مناسب

#### الكود المطلوب:
```kotlin
class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.stackmobile/termux"
    
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            when (call.method) {
                "checkTermuxAPI" -> {
                    // Check if Termux:API is installed
                    result.success(isTermuxAPIInstalled())
                }
                "executeCommand" -> {
                    // Execute command via Termux
                    val command = call.argument<String>("command")
                    executeTermuxCommand(command, result)
                }
                // ... other methods
                else -> result.notImplemented()
            }
        }
    }
}
```

---

### 2. ❌ SSH Connection لا يحفظ الاتصال
**الحالة:** 🔴 لم يتم الحل  
**الأولوية:** حرجة  
**التأثير:** يمنع الانتقال إلى IDE Screen بعد الاتصال

#### الوصف:
عند الاتصال بـ SSH، يتم إنشاء `SSHConnectionProvider` جديد في `TermuxSetupScreen` و `SSHSetupScreen` لكن لا يتم حفظه في `connectionProvider` الـ global.

#### الملف المشكل:
```dart
// lib/features/setup/presentation/termux_setup_screen.dart
Future<void> _connect() async {
  // ...
  final provider = ConnectionFactory.create(ConnectionType.termux);
  await provider.connect(config);
  
  if (mounted) {
    context.go('/ide');  // ❌ الانتقال بدون حفظ الاتصال
  }
}
```

#### المشكلة:
- يتم إنشاء provider محلي في الـ screen
- لا يتم تمريره إلى `connectionProvider` الـ global
- عند الانتقال إلى `/ide`، لا يوجد اتصال نشط
- `fileRepositoryProvider` يعود `null` لأن `connectionProvider.notifier.provider` فارغ

#### الحل المطلوب:
```dart
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
```

---

### 3. ❌ File Explorer يفشل عند فتح IDE
**الحالة:** 🔴 لم يتم الحل  
**الأولوية:** حرجة  
**التأثير:** لا يمكن استعراض الملفات في IDE

#### الوصف:
`fileRepositoryProvider` يعود `null` لأن لا يوجد اتصال نشط.

#### الملف المشكل:
```dart
// lib/features/ide/presentation/file_explorer.dart
final fileRepositoryProvider = Provider<FileRepository?>((ref) {
  final connection = ref.watch(connectionProvider.notifier).provider;
  if (connection == null) return null;  // ❌ دائماً null
  return FileRepositoryImpl(connection);
});
```

#### المشكلة:
- `connectionProvider.notifier.provider` دائماً `null` لأن الاتصال لم يُحفظ
- عند محاولة قراءة الملفات، يحدث exception

#### الحل المطلوب:
1. إصلاح حفظ الاتصال (المشكلة #2)
2. إضافة error handling أفضل
3. إضافة loading state

---

### 4. ❌ Terminal Widget غير مكتمل
**الحالة:** 🔴 لم يتم الحل  
**الأولوية:** حرجة  
**التأثير:** لا يمكن استخدام Terminal

#### الوصف:
الـ Terminal Widget يحتوي على كود لكن الـ UI تعرض فقط "Terminal - Coming Soon".

#### الملف المشكل:
```dart
// lib/features/terminal/presentation/terminal_widget.dart
@override
Widget build(BuildContext context) {
  return Container(
    color: Theme.of(context).colorScheme.surface,
    child: const Center(
      child: Text('Terminal - Coming Soon'),  // ❌ لا يعرض Terminal
    ),
  );
}
```

#### المشكلة:
- الكود موجود لكن الـ UI لا تستخدمه
- `xterm` package موجود لكن لا يتم عرضه
- الـ input handling موجود لكن لا يعمل

#### الحل المطلوب:
```dart
@override
Widget build(BuildContext context) {
  return Container(
    color: Theme.of(context).colorScheme.surface,
    child: TerminalView(
      _terminal,
      theme: TerminalTheme(
        cursor: Color(0xFF6366F1),
        selection: Color(0xFF6366F1).withOpacity(0.3),
        foreground: Theme.of(context).colorScheme.onSurface,
        background: Theme.of(context).colorScheme.surface,
      ),
    ),
  );
}
```

---

### 5. ❌ Nexor AI غير مهيأ
**الحالة:** 🔴 لم يتم الحل  
**الأولوية:** متوسطة  
**التأثير:** لا يمكن استخدام AI Assistant

#### الوصف:
`apiKey` في `QwenProvider` هو `null` ولا توجد طريقة لإدخاله.

#### الملف المشكل:
```dart
// lib/features/nexor/presentation/nexor_screen.dart
final qwenProviderProvider = Provider((ref) => QwenProvider(
  apiKey: null, // TODO: Load from settings
));
```

#### المشكلة:
- لا توجد settings screen لإدخال API key
- `isConfigured` دائماً `false`
- الـ AI لا يعمل أبداً

#### الحل المطلوب:
1. إضافة API key input في Settings
2. حفظ API key في SharedPreferences
3. تحميل API key عند بدء التطبيق

---

### 6. ❌ AndroidManifest.xml ينقصه Permissions
**الحالة:** 🔴 لم يتم الحل  
**الأولوية:** حرجة  
**التأثير:** لا يمكن الوصول إلى الملفات أو الشبكة

#### الوصف:
`AndroidManifest.xml` لا يحتوي على أي permissions مطلوبة.

#### Permissions المطلوبة:
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

---

### 7. ❌ Package Name غير صحيح
**الحالة:** 🔴 لم يتم الحل  
**الأولوية:** متوسطة  
**التأثير:** مشاكل في النشر والتعريف

#### الوصف:
Package name هو `com.example.myapp` وهو اسم تجريبي.

#### الحل المطلوب:
تغيير إلى `com.stackmobile.app` في:
1. `AndroidManifest.xml`
2. `build.gradle.kts`
3. `MainActivity.kt` package name
4. مجلد الـ source code

---

## ⚠️ المشاكل المتوسطة (Medium Issues)

### 8. ⚠️ عدم وجود Error Handling شامل
**الحالة:** 🟡 جزئي  
**الأولوية:** متوسطة

#### المشكلة:
- معظم الـ try-catch blocks تعرض فقط `e.toString()`
- لا يوجد logging system
- لا يوجد error reporting

#### الحل المطلوب:
1. استخدام `logger.dart` الموجود
2. إضافة error boundaries
3. إضافة user-friendly error messages

---

### 9. ⚠️ State Management غير متسق
**الحالة:** 🟡 جزئي  
**الأولوية:** متوسطة

#### المشكلة:
- بعض الـ screens تستخدم `StatefulWidget` مع `setState`
- بعضها يستخدم `Riverpod`
- لا يوجد consistency

#### الحل المطلوب:
توحيد استخدام Riverpod في كل المشروع

---

### 10. ⚠️ Code Editor غير مكتمل
**الحالة:** 🟡 جزئي  
**الأولوية:** متوسطة

#### المشكلة:
- `re_editor` موجود لكن features محدودة
- لا يوجد syntax highlighting كامل
- لا يوجد auto-completion

---

### 11. ⚠️ File Operations بطيئة
**الحالة:** 🟡 جزئي  
**الأولوية:** متوسطة

#### المشكلة:
- كل file operation تنتظر response
- لا يوجد caching
- لا يوجد lazy loading

---

### 12. ⚠️ Theme System محدود
**الحالة:** 🟢 يعمل لكن محدود  
**الأولوية:** منخفضة

#### المشكلة:
- يوجد Dark/Light theme فقط
- `accent_color_provider.dart` موجود لكن غير مستخدم
- لا يوجد theme customization

---

### 13. ⚠️ Navigation غير آمن
**الحالة:** 🟡 جزئي  
**الأولوية:** متوسطة

#### المشكلة:
- يمكن الانتقال إلى `/ide` بدون اتصال
- لا يوجد route guards
- لا يوجد authentication check

#### الحل المطلوب:
```dart
redirect: (context, state) {
  final hasConnection = ref.read(connectionProvider).state != ConnectionState.disconnected;
  
  if (state.location.startsWith('/ide') && !hasConnection) {
    return '/setup';
  }
  return null;
}
```

---

### 14. ⚠️ Memory Leaks محتملة
**الحالة:** 🟡 غير مؤكد  
**الأولوية:** متوسطة

#### المشكلة:
- `StreamController` في connection providers قد لا يتم dispose
- `TextEditingController` في بعض الـ screens
- Terminal buffer قد يكبر جداً

---

### 15. ⚠️ Testing غير موجود
**الحالة:** 🔴 لا يوجد  
**الأولوية:** متوسطة

#### المشكلة:
- لا توجد unit tests
- لا توجد widget tests
- لا توجد integration tests

---

### 16. ⚠️ Documentation ناقصة
**الحالة:** 🟡 جزئي  
**الأولوية:** منخفضة

#### المشكلة:
- README جيد لكن لا يشرح كيفية الإعداد
- لا توجد API documentation
- لا توجد architecture documentation كاملة

---

### 17. ⚠️ Build Configuration مشاكل
**الحالة:** 🟡 جزئي  
**الأولوية:** متوسطة

#### المشكلة:
- `isar` معطل في pubspec.yaml
- بعض الـ dependencies قديمة
- لا يوجد CI/CD

---

### 18. ⚠️ Security Issues
**الحالة:** 🔴 حرج  
**الأولوية:** حرجة

#### المشكلة:
- SSH password يُحفظ في plain text في metadata
- لا يوجد encryption
- API keys في الكود

#### الحل المطلوب:
1. استخدام `flutter_secure_storage`
2. تشفير البيانات الحساسة
3. عدم حفظ passwords في memory

---

### 19. ⚠️ Performance Issues
**الحالة:** 🟡 غير مختبر  
**الأولوية:** متوسطة

#### المشكلة المحتملة:
- File tree قد يكون بطيء مع ملفات كثيرة
- Terminal buffer غير محدود
- No pagination في file listing

---

## 💡 التحسينات المقترحة (Improvements)

### 20. 💡 إضافة Offline Mode
- حفظ الملفات المفتوحة مؤخراً
- Cache للـ file tree
- Work offline ثم sync

### 21. 💡 إضافة Git Integration
- Clone repositories
- Commit/Push/Pull
- Branch management

### 22. 💡 إضافة Plugin System
- Extensible architecture موجود (Nexi)
- لكن يحتاج hot reload للـ plugins
- Plugin marketplace

### 23. 💡 إضافة Collaboration
- Real-time editing
- Share sessions
- Code review

### 24. 💡 تحسين UI/UX
- Keyboard shortcuts
- Gesture controls
- Customizable layout

### 25. 💡 إضافة Debugging Tools
- Breakpoints
- Variable inspection
- Step debugging

### 26. 💡 إضافة Code Snippets
- Template system
- Custom snippets
- Share snippets

### 27. 💡 إضافة Search & Replace
- Global search
- Regex support
- Replace in files

---

## 📊 إحصائيات المشروع

### حجم الكود:
- **Total Files:** 884
- **Dart Files:** ~50+
- **Lines of Code:** ~10,000+

### Dependencies:
- ✅ **Working:** flutter_riverpod, go_router, dio, dartssh2
- ⚠️ **Partial:** re_editor, xterm
- ❌ **Disabled:** isar

### Architecture:
- ✅ **Good:** Clean Architecture structure
- ✅ **Good:** Feature-based organization
- ⚠️ **Needs Work:** State management consistency
- ❌ **Missing:** Proper dependency injection

---

## 🎯 خطة العمل المقترحة

### المرحلة 1: إصلاح المشاكل الحرجة (أسبوع 1)
1. ✅ إضافة Native Android code لـ Termux
2. ✅ إصلاح SSH connection saving
3. ✅ إصلاح File Explorer
4. ✅ إصلاح Terminal Widget
5. ✅ إضافة Permissions

### المرحلة 2: تحسين الاستقرار (أسبوع 2)
1. ✅ إضافة Error Handling شامل
2. ✅ إصلاح Memory Leaks
3. ✅ إضافة Navigation Guards
4. ✅ تحسين Security

### المرحلة 3: إضافة Features (أسبوع 3-4)
1. ✅ إكمال Code Editor
2. ✅ إضافة Settings Screen
3. ✅ تفعيل Nexor AI
4. ✅ تحسين Theme System

### المرحلة 4: Testing & Polish (أسبوع 5)
1. ✅ كتابة Tests
2. ✅ Performance optimization
3. ✅ Documentation
4. ✅ Release preparation

---

## 📝 ملاحظات إضافية

### نقاط القوة:
- ✅ Architecture جيد ومنظم
- ✅ UI/UX جميل ومتناسق
- ✅ Feature set طموح
- ✅ Code quality جيد بشكل عام

### نقاط الضعف:
- ❌ Implementation غير مكتمل
- ❌ Testing غير موجود
- ❌ Security issues
- ❌ Documentation ناقصة

### التوصيات:
1. **التركيز على Core Features أولاً** قبل إضافة features جديدة
2. **إضافة Testing** من البداية
3. **تحسين Error Handling** في كل مكان
4. **Security Audit** قبل أي release
5. **Performance Testing** على أجهزة حقيقية

---

## 🔗 ملفات ذات صلة

- [ARCHITECTURE.md](../ARCHITECTURE.md) - معلومات عن البنية
- [USER_GUIDE.md](../USER_GUIDE.md) - دليل المستخدم
- [README.md](../README.md) - معلومات عامة

---

**آخر تحديث:** 2026-02-02  
**المراجع:** Kiro AI Assistant  
**الحالة:** قيد المراجعة
