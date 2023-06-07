import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../generated/l10n.dart';
import '../auth/signout_provider.dart';
import 'theme_provider.dart';

class SettingsView extends HookConsumerWidget {
  const SettingsView({super.key});

  static const routeName = '/settings';

  @override
  Widget build(context, ref) {
    setTheme(themeMode) {
      ref.read(themeProvider.notifier).setThemeMode(themeMode);
    }

    signOut() {
      ref.read(signOutProvider);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).pageSettingsTitle),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(S.of(context).pageSettingsTheme),
            trailing: DropdownButton<ThemeMode>(
              value: ref.watch(themeProvider),
              onChanged: setTheme,
              items: [
                DropdownMenuItem(
                  value: ThemeMode.system,
                  child: Text(S.of(context).pageSettingsThemeType('system')),
                ),
                DropdownMenuItem(
                  value: ThemeMode.light,
                  child: Text(S.of(context).pageSettingsThemeType('light')),
                ),
                DropdownMenuItem(
                  value: ThemeMode.dark,
                  child: Text(S.of(context).pageSettingsThemeType('dark')),
                )
              ],
            ),
          ),
          ListTile(
            title: Text(S.of(context).pageSettingsLogout),
            trailing: const Icon(Icons.logout),
            onTap: signOut,
          ),
        ],
      ),
    );
  }
}
