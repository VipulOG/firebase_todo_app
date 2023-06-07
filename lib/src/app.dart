import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../generated/l10n.dart';
import 'auth/auth_view.dart';
import 'auth/is_authenticated_provider.dart';
import 'settings/settings_view.dart';
import 'settings/theme_provider.dart';

class MyApp extends HookConsumerWidget {
  MyApp({super.key});

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(context, ref) {
    ref.listen(isAuthenticatedProvider, (_, isAuthenticated) {
      if (isAuthenticated) {
        navigatorKey.currentState?.pushNamedAndRemoveUntil(
          SettingsView.routeName,
          (Route<dynamic> route) => false,
        );
      } else {
        navigatorKey.currentState?.pushNamedAndRemoveUntil(
          AuthView.routeName,
          (Route<dynamic> route) => false,
        );
      }
    });

    return MaterialApp(
      navigatorKey: navigatorKey,
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
              case AuthView.routeName:
                return const AuthView();
              case SettingsView.routeName:
                return const SettingsView();
              default:
                return ErrorWidget("Not Found");
            }
          },
        );
      },
    );
  }
}
