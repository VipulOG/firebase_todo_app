import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_todo_app/src/auth/is_authenticated_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signout_provider.g.dart';

@riverpod
FutureOr<void> signOut(SignOutRef ref) async {
  final res = FirebaseAuth.instance.signOut();
  ref.invalidate(isAuthenticatedProvider);
  return res;
}
