import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'is_authenticated_provider.dart';

part 'signin_provider.g.dart';

@riverpod
FutureOr<UserCredential> signIn(SignInRef ref) async {
  if (kIsWeb) {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();
    final res = await FirebaseAuth.instance.signInWithPopup(googleProvider);
    ref.invalidate(isAuthenticatedProvider);
    return res;
  }

  final googleUser = await GoogleSignIn().signIn();
  final googleAuth = await googleUser?.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  final res = await FirebaseAuth.instance.signInWithCredential(credential);
  ref.invalidate(isAuthenticatedProvider);
  return res;
}
