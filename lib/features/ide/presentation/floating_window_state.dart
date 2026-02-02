import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'floating_window_state.freezed.dart';

@freezed
class FloatingWindow with _$FloatingWindow {
  const factory FloatingWindow({
    required String id,
    required String title,
    required Widget content,
    required double x,
    required double y,
    required double width,
    required double height,
    @Default(false) bool minimized,
    @Default(1) int zIndex,
  }) = _FloatingWindow;
}

class FloatingWindowsNotifier extends StateNotifier<List<FloatingWindow>> {
  FloatingWindowsNotifier() : super([]);

  void addWindow(FloatingWindow window) {
    state = [...state, window];
  }

  void removeWindow(String id) {
    state = state.where((w) => w.id != id).toList();
  }

  void updatePosition(String id, double x, double y) {
    state = state.map((w) => w.id == id ? w.copyWith(x: x, y: y) : w).toList();
  }

  void updateSize(String id, double width, double height) {
    state = state.map((w) => w.id == id ? w.copyWith(width: width, height: height) : w).toList();
  }

  void toggleMinimize(String id) {
    state = state.map((w) => w.id == id ? w.copyWith(minimized: !w.minimized) : w).toList();
  }

  void bringToFront(String id) {
    final maxZ = state.isEmpty ? 0 : state.map((w) => w.zIndex).reduce((a, b) => a > b ? a : b);
    state = state.map((w) => w.id == id ? w.copyWith(zIndex: maxZ + 1) : w).toList();
  }
}

final floatingWindowsProvider = StateNotifierProvider<FloatingWindowsNotifier, List<FloatingWindow>>((ref) {
  return FloatingWindowsNotifier();
});
