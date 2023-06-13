//FXH
import 'package:flutter/material.dart';
import 'package:laas/components/Lender/header.dart';
import 'package:laas/components/Lender/review.dart';
import 'package:laas/components/Lender/debt_analysis.dart';

class LApprove extends StatelessWidget {
  final String contractId;
  const LApprove({super.key, this.contractId = ""});

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
                child: Column(
                  children: [
                    review(context),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Transaction History",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .fontSize),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        debtAnalysisBox(context, "0", "0"),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    approveButton(context),
                    const SizedBox(
                      height: 17,
                    ),
                    declineButton(context),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

Widget approveButton(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(50),
      backgroundColor: Theme.of(context).colorScheme.primary,
    ),
    onPressed: () {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('approve successfully')),
      );
    },
    child: Text(
      "Approve",
      style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
          fontSize: Theme.of(context).textTheme.titleMedium!.fontSize),
    ),
  );
}

Widget declineButton(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(50),
      backgroundColor: Theme.of(context).colorScheme.surface,
    ),
    onPressed: () {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('decline successfully')),
      );
    },
    child: Text(
      "Decline",
      style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
          fontSize: Theme.of(context).textTheme.titleMedium!.fontSize),
    ),
  );
}
