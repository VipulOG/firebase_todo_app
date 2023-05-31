import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import 'settings_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).pageSettingsTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DropdownButton<ThemeMode>(
          value: controller.themeMode,
          onChanged: controller.updateThemeMode,
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
