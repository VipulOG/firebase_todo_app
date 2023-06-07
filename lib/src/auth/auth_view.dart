import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../generated/l10n.dart';
import 'signin_provider.dart';

class AuthView extends HookConsumerWidget {
  const AuthView({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    signIn() {
      ref.read(signInProvider);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).pageAuthTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FilledButton(
          onPressed: signIn,
          child: Text(S.of(context).pageAuthSignIn),
        ),
      ),
    );
  }
}
