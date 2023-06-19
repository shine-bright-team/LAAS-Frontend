//fxh
import 'package:flutter/material.dart';
import 'package:laas/components/Lender/header.dart';
import 'package:laas/components/Lender/com_argeement.dart';
import 'package:laas/components/Lender/review.dart';
import 'package:laas/model/agreement.dart';
import 'package:laas/services/data/agreement/get_agreement.dart';
import 'package:laas/services/data/userdata/get_user.dart';

class LProfileScreen extends StatefulWidget {
  const LProfileScreen({super.key});

  @override
  State<LProfileScreen> createState() => _LProfileScreenState();
}

class _LProfileScreenState extends State<LProfileScreen> {
  UserRes? user;
  Agreements? agreements;
  String? firstname;
  String? lastname;
  double? interestRate;
  int? dueIn;
  String? addition;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  _getData() async {
    user = await getUser();
    agreements = await getAgreement();

    firstname = user!.firstname;
    lastname = user!.lastname;
    interestRate = agreements!.interestRate;
    dueIn = agreements!.dueIn;
    addition = agreements!.addition;

    setState(() {
      firstname;
      lastname;
      interestRate;
      dueIn;
      addition;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              header(context, firstname, lastname),
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
                    logoutButton(context),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

Widget editButton(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(50),
      backgroundColor: Theme.of(context).colorScheme.surface,
    ),
    onPressed: () {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Edit successfully')),
      // );
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

Widget logoutButton(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(50),
      backgroundColor: Theme.of(context).colorScheme.primary,
    ),
    onPressed: () {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Log out successfully')),
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
