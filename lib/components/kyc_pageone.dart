import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laas/config/theme/custom_warpper.dart';

class Kycpageone extends ConsumerStatefulWidget {
  const Kycpageone({super.key});

  @override
  ConsumerState<Kycpageone> createState() => _KycpageoneState();
}

class _KycpageoneState extends ConsumerState<Kycpageone> {
  final List<String> _condition = [
    "Lender need to pay subscription to use our application",
    "The subscription will cost 75 THB per Month",
    "The information you provide us must be legally true. Providing false information can lead to legal action."
  ];
  final List<String> _privacy = [
    "When using our service. We need to collect your information for KYC verification."
  ];
  final List<String> _age = [
    "You must be at least 18 years of age before using our service."
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                textAlign: TextAlign.left,
                "Terms and Agreement",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Condition of use",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize:
                          Theme.of(context).textTheme.bodyMedium!.fontSize,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: _condition.map((e) {
                return Row(children: [
                  const SizedBox(
                    width: 10,
                  ), //space between bullet and text
                  Expanded(
                    child: Text(
                      "\u2022 $e",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium!.fontSize,
                      ),
                    ),
                  )
                ]);
              }).toList(),
            ),
            const SizedBox(
              width: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Privacy policy",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize:
                          Theme.of(context).textTheme.bodyMedium!.fontSize,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: _privacy.map((e) {
                return Row(children: [
                  const SizedBox(
                    width: 10,
                  ), //space between bullet and text
                  Expanded(
                    child: Text(
                      "\u2022 $e",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium!.fontSize,
                      ),
                    ),
                  )
                ]);
              }).toList(),
            ),
            const SizedBox(
              width: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Age restriction",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize:
                          Theme.of(context).textTheme.bodyMedium!.fontSize,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: _age.map((e) {
                return Row(children: [
                  const SizedBox(
                    width: 10,
                  ), //space between bullet and text
                  Expanded(
                    child: Text(
                      "\u2022 $e",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium!.fontSize,
                      ),
                    ),
                  )
                ]);
              }).toList(),
            ),
          ],
        ),
      ],
    );
  }
}
