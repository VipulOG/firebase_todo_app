import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../generated/l10n.dart';
import 'settings/settings_view.dart';
import 'settings/theme_provider.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(context, ref) {
    return MaterialApp(
      restorationScopeId: 'app',
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: "FirebaseTodoApp",
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ref.watch(themeProvider),
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case SettingsView.routeName:
                return const SettingsView();
              default:
                return const Center(child: CircularProgressIndicator());
            }
          },
        );
      },
    );
  }
}
