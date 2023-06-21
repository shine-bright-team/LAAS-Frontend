//fxh
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:laas/components/Lender/header.dart';
import 'package:laas/components/Lender/com_argeement.dart';
import 'package:laas/components/Lender/review.dart';
import 'package:laas/providers/authProvider.dart';
import 'package:laas/services/data/agreement/get_agreement.dart';
import 'package:laas/services/data/userdata/get_user.dart';

class LProfileScreen extends ConsumerStatefulWidget {
  const LProfileScreen({super.key});

  @override
  ConsumerState<LProfileScreen> createState() => _LProfileScreenState();
}

class _LProfileScreenState extends ConsumerState<LProfileScreen> {
  UserRes? user;
  Agreements? agreements;
  String? firstname;
  String? lastname;
  late bool isLender;
  late String amountRange;
  String? interestRate;
  int? dueIn;
  String? addition;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initCheck();
  }

  _initCheck() async {
    UserRes? tempUser;
    Agreements? tempAgreements;

    try {
      tempUser = await getUser();
      tempAgreements = await getAgreement();
    } catch (err) {
      rethrow;
    }

    if (mounted) {
      setState(() {
        user = tempUser;
        agreements = tempAgreements;
        firstname = user!.firstname;
        lastname = user!.lastname;
        isLender = user!.isLender;
        amountRange = agreements!.amountRange;
        interestRate = agreements!.interestRate;
        dueIn = agreements!.dueIn;
        addition = agreements!.addition;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final counter = ref.watch(authProvider);
    if (!isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(context, firstname, lastname, isLender, amountRange),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Center(
                  child: Column(
                    children: [
                      review(context),
                      const SizedBox(
                        height: 20,
                      ),
                      agreement(context, interestRate, dueIn, addition)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    editButton(context),
                    const SizedBox(
                      height: 17,
                    ),
                    update(context),
                    const SizedBox(
                      height: 17,
                    ),
                    logoutButton(context, counter)
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text(
              "Home",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          body: Stack(children: [
            SingleChildScrollView(
                child: Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 55),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [Center(child: Text('Loading...'))],
              ),
            ))
          ]));
    }
  }

  Widget editButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Edit successfully')),
        );
      },
      child: Text(
        "Edit Agreement",
        style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
            fontSize: Theme.of(context).textTheme.titleMedium!.fontSize),
      ),
    );
  }

  Widget update(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      onPressed: () {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(content: Text('Update KYC successfully')),
        // );
      },
      child: Text(
        "Update KYC",
        style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
            fontSize: Theme.of(context).textTheme.titleMedium!.fontSize),
      ),
    );
  }

  Widget logoutButton(BuildContext context, counter) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      onPressed: () {
        counter.logout();
        context.go("/login");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Logout successfully')),
        );
      },
      child: Text(
        "Log Out",
        style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
            fontSize: Theme.of(context).textTheme.titleMedium!.fontSize),
      ),
    );
  }
}
