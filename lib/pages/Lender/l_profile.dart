//fxh
import 'package:flutter/material.dart';
import 'package:laas/components/Lender/header.dart';
import 'package:laas/components/Lender/com_argeement.dart';
import 'package:laas/components/Lender/review.dart';

class LProfileScreen extends StatelessWidget {
  const LProfileScreen({super.key});

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
              header(context),
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
                      agreement(context)
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
