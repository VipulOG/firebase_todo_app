import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_authenticated_provider.g.dart';

@Riverpod(keepAlive: true)
bool isAuthenticated(IsAuthenticatedRef ref) {
  return FirebaseAuth.instance.currentUser != null;
}
