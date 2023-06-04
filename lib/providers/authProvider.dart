// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:laas/model/user_login_model.dart';
// import 'package:laas/model/user_model.dart';

// import '../services/auth/authService.dart';

// final authProvider = Provider((ref) => AuthService());

// final authValueProvider = ChangeNotifierProvider<UserCredential?>((ref) {
//   final authService = ref.watch(authProvider);
//   return authService.user;
// });

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laas/services/auth/authenticationservice.dart';

final authProvider = ChangeNotifierProvider<AuthenticationService>((ref) {
  var authservice = AuthenticationService();
  authservice.initPrefs();
  return authservice;
});
