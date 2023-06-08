// ignore_for_file: file_names

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laas/services/auth/authenticationservice.dart';

final authProvider = ChangeNotifierProvider<AuthenticationService>((ref) {
  var authservice = AuthenticationService();
  authservice.initPrefs();
  return authservice;
});
