import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@Riverpod(keepAlive: true)
class Theme extends _$Theme {
  @override
  ThemeMode build() {
    // TODO: Use the shared_preferences package to load the saved theme mode
    return ThemeMode.system;
  }

  void setThemeMode(ThemeMode themeMode) {
    // TODO: Use the shared_preferences package to persist settings locally
    state = themeMode;
  }
}