import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final accentColorProvider = StateNotifierProvider<AccentColorNotifier, Color>((ref) {
  return AccentColorNotifier();
});

class AccentColorNotifier extends StateNotifier<Color> {
  AccentColorNotifier() : super(const Color(0xFF6366F1)) {
    _loadColor();
  }

  Future<void> _loadColor() async {
    final prefs = await SharedPreferences.getInstance();
    final colorValue = prefs.getInt('accentColor');
    if (colorValue != null) {
      state = Color(colorValue);
    }
  }

  Future<void> setColor(Color color) async {
    state = color;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('accentColor', color.value);
  }
}

class AccentColors {
  static const indigo = Color(0xFF6366F1);
  static const purple = Color(0xFF8B5CF6);
  static const pink = Color(0xFFEC4899);
  static const red = Color(0xFFEF4444);
  static const orange = Color(0xFFF97316);
  static const yellow = Color(0xFFF59E0B);
  static const green = Color(0xFF10B981);
  static const teal = Color(0xFF14B8A6);
  static const cyan = Color(0xFF06B6D4);
  static const blue = Color(0xFF3B82F6);

  static const all = [
    indigo,
    purple,
    pink,
    red,
    orange,
    yellow,
    green,
    teal,
    cyan,
    blue,
  ];
}
