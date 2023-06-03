import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laas/model/user_login_model.dart';
import 'package:laas/model/user_model.dart';

import '../services/auth/authService.dart';

final authProvider = Provider((ref) => AuthService());

final authValueProvider = StreamProvider<UserCredential?>((ref) {
  final authService = ref.watch(authProvider);
  return authService.user;
});
