import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:laas/components/Borrower/BottomNavB.dart';
import 'package:laas/components/Lender/BottomNavL.dart';
import 'package:laas/pages/Borrower/b_home.dart';
import 'package:laas/pages/Borrower/b_payment.dart';
import 'package:laas/pages/Borrower/b_profile.dart';
import 'package:laas/pages/Borrower/b_loan_status.dart';
import 'package:laas/pages/Borrower/request_loan.dart';
import 'package:laas/pages/Lender/L_Home.dart';
import 'package:laas/pages/Lender/l_approve.dart';
import 'package:laas/pages/Lender/l_create_lone.dart';
import 'package:laas/pages/Lender/l_loan_status.dart';
import 'package:laas/pages/Lender/l_profile.dart';
import 'package:laas/pages/Lender/search.dart';
import 'package:laas/pages/login.dart';
import 'package:laas/pages/Lender/l_payment.dart';
import 'package:laas/pages/register.dart';

import '../providers/authProvider.dart';

// All routes go here.
class AppGoRouter extends ChangeNotifier {
  final Ref ref;
  final isLender = true;
  AppGoRouter({required this.ref}) {
    ref.listen(authValueProvider, (previous, next) {
      notifyListeners();
    });
  }
  late final authState = ref.watch(authValueProvider);

  String? redirectlogic(BuildContext context, GoRouterState state) {
    if (dotenv.env['DISABLE_LOGIN'] == "true") return null;
    if (authState.isLoading || authState.hasError) return null;
    final isAuth = authState.valueOrNull != null;
    if (isAuth &&
        (state.location == '/login' || state.location == '/register')) {
      if (isLender) {
        return '/';
      } else {
        return '/b';
      }
    }
    if (!isAuth &&
        (state.location != '/login' && state.location != '/register')) {
      return '/login';
    }
    return null;
  }

  late final routes = [
    ShellRoute(
      routes: [
        ShellRoute(
          routes: [
            GoRoute(
              path: "/",
              builder: (context, state) => const LHome(),
            ),
            GoRoute(
              path: "/search",
              builder: (context, state) => const Search(),
            ),
            GoRoute(
              path: "/l/profile",
              builder: (context, state) => const LProfileScreen(),
            ),
          ],
          builder: (context, state, child) => Scaffold(
            bottomNavigationBar: const BottomNavL(),
            body: child,
          ),
        ),
        GoRoute(
          path: "/l/loanstatus",
          builder: (context, state) => const LLoanStatus(),
        ),
        GoRoute(
          path: "/l/createlone",
          builder: (context, state) => const LCreateLoan(),
        ),
        GoRoute(
          path: "/l/apporvelone",
          builder: (context, state) => const LApprove(),
        ),
        GoRoute(
          path: "/l/payment",
          builder: (context, state) => const LPaymentScreen(),
        ),
        ShellRoute(
          routes: [
            GoRoute(
              path: "/b",
              builder: (context, state) => const BHome(),
            ),
            GoRoute(
              path: "/b/profile",
              builder: (context, state) => const BProfileScreen(),
            ),
          ],
          builder: (context, state, child) => Scaffold(
            bottomNavigationBar: const BottomNavB(),
            body: child,
          ),
        ),
        GoRoute(
          path: "/b/requestloan",
          builder: (context, state) => const RequestLoan(),
        ),
        GoRoute(
          path: "/b/loanstatus",
          builder: (context, state) => const BLoanStatus(),
        ),
        GoRoute(
          path: "/b/payment",
          builder: (context, state) => const BPaymentScreen(),
        ),
        GoRoute(
          path: "/login",
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: "/register",
          builder: (context, state) => const RegisterPage(),
        ),
      ],
      // builder: (context, state, child) {
      //   if (authState.isLoading) {
      //     return const LoadingScreen();
      //   } else {
      //     return child;
      //   }
      // },
    )
  ];
}
