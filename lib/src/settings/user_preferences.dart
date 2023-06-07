import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  UserPreferences(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  static const _keyThemeMode = 'themeMode';

  ThemeMode get themeMode {
    final themeModeIndex = _sharedPreferences.getInt(_keyThemeMode);
    if (themeModeIndex == null) return ThemeMode.system;
    return ThemeMode.values[themeModeIndex];
  }

  Future<void> updateThemeMode(ThemeMode newThemeMode) async {
    await _sharedPreferences.setInt(_keyThemeMode, newThemeMode.index);
  }
}
