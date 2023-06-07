import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'user_prefs_provider.dart';

part 'theme_provider.g.dart';

@Riverpod(keepAlive: true)
class Theme extends _$Theme {
  @override
  ThemeMode build() {
    final userPrefs = ref.read(userPrefsProvider);
    return userPrefs.themeMode;
  }

  void setThemeMode(ThemeMode themeMode) {
    final userPrefs = ref.read(userPrefsProvider);
    userPrefs.updateThemeMode(themeMode);
    state = themeMode;
  }
}