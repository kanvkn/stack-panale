import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tab_state.freezed.dart';

@freezed
class EditorTab with _$EditorTab {
  const factory EditorTab({
    required String id,
    required String name,
    required String path,
    required String content,
    @Default(false) bool isDirty,
  }) = _EditorTab;
}

class TabsNotifier extends StateNotifier<List<EditorTab>> {
  TabsNotifier() : super([]);

  void openTab(String path, String name, String content) {
    final existing = state.firstWhere(
      (tab) => tab.path == path,
      orElse: () => EditorTab(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        path: path,
        content: content,
      ),
    );

    if (!state.contains(existing)) {
      state = [...state, existing];
    }
  }

  void closeTab(String id) {
    state = state.where((tab) => tab.id != id).toList();
  }

  void updateTabContent(String id, String content) {
    state = state.map((tab) {
      if (tab.id == id) {
        return tab.copyWith(content: content, isDirty: true);
      }
      return tab;
    }).toList();
  }

  void markTabClean(String id) {
    state = state.map((tab) {
      if (tab.id == id) {
        return tab.copyWith(isDirty: false);
      }
      return tab;
    }).toList();
  }
}

final tabsProvider = StateNotifierProvider<TabsNotifier, List<EditorTab>>((ref) {
  return TabsNotifier();
});

final activeTabIdProvider = StateProvider<String?>((ref) => null);
