import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laas/components/Lender/verify_information.dart';

class Kyc extends ConsumerStatefulWidget {
  const Kyc({super.key});

  @override
  ConsumerState<Kyc> createState() => _KycState();
}

class _KycState extends ConsumerState<Kyc> {
  bool isAgreed = false;

  void agree(bool? check) {
    setState(() {
      isAgreed = check!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("LApprove"),
      // ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(50),
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const LinearProgressIndicator(value: 0.5),
                  const SizedBox(height: 35),
                  Text(
                    "Terms and Agreement",
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headlineSmall!.fontSize,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Condition of use\n  • Lender need to pay subscription to use our application\n  • The subscription will cost 75 THB per Month\n  • The information you provide us must be legally true. Providing false information can lead to legal action.",
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium!.fontSize,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Privacy policy\n  • When using our service. We need to collect your information for KYC verification.",
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium!.fontSize,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Age restriction\n  • You must be at least 18 years of age before using our service.",
                    style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium!.fontSize,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Theme.of(context).colorScheme.background,
              padding: const EdgeInsets.only(bottom: 100, left: 50, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(value: isAgreed, onChanged: agree),
                  const SizedBox(width: 5),
                  const Flexible(
                    child: Text("I agree with the terms and agreement"),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40, left: 50, right: 50),
              child: Row(
                children: [
                  const Expanded(child: SizedBox()),
                  Expanded(
                    child: FilledButton(
                      onPressed: () => isAgreed
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const VerifyInformation()))
                          : null,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (!isAgreed) {
                              return Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.5);
                            } else {
                              return Theme.of(context).colorScheme.primary;
                            }
                          },
                        ),
                      ),
                      child: const Text("Next"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
