import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'shared_prefs_provider.dart';
import 'user_preferences.dart';

part 'user_prefs_provider.g.dart';

@Riverpod(keepAlive: true)
UserPreferences userPrefs(UserPrefsRef ref) {
  return UserPreferences(ref.watch(sharedPrefsProvider));
}