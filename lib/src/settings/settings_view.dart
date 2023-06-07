import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../generated/l10n.dart';
import 'theme_provider.dart';

class SettingsView extends HookConsumerWidget {
  const SettingsView({super.key});

  static const routeName = '/settings';

  @override
  Widget build(context, ref) {

    setTheme(themeMode) {
      ref.read(themeProvider.notifier).setThemeMode(themeMode!);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).pageSettingsTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DropdownButton<ThemeMode>(
          value: ref.watch(themeProvider),
          onChanged: setTheme,
          items: [
            DropdownMenuItem(
              value: ThemeMode.system,
              child: Text(S.of(context).themeType('system')),
            ),
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text(S.of(context).themeType('light')),
            ),
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text(S.of(context).themeType('dark')),
            )
          ],
        ),
      ),
    );
  }
}
