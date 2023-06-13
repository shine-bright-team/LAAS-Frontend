import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laas/config/theme/custom_color.g.dart';
import 'package:laas/config/theme/custom_warpper.dart';

class Kycpageone extends ConsumerStatefulWidget {
  const Kycpageone({super.key});

  @override
  ConsumerState<Kycpageone> createState() => _KycpageoneState();
}

class _KycpageoneState extends ConsumerState<Kycpageone> {
  List<String> _condition = [
    "Lender need to pay subscription to use our application",
    "The subscription will cost 75 THB per Month",
    "The information you provide us must be legally true. Providing false information can lead to legal action."
  ];
  List<String> _privacy = [
    "When using our service. We need to collect your information for KYC verification."
  ];
  List<String> _age = [
    "You must be at least 18 years of age before using our service."
  ];
  void _selectDate() async {}

  @override
  Widget build(BuildContext context) {
    return Container(
        color: redbar,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  constraints: wrapperConstranints,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Terms and Agreement",
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .fontSize,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Condition of use",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .fontSize,
                                    ),
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
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                              fontSize: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .fontSize,
                                            ),
                                          ), //text
                                        )
                                      ]);
                                    }).toList(),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ), //sp
                                  Text(
                                    "Privacy policy",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .fontSize,
                                    ),
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
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                              fontSize: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .fontSize,
                                            ),
                                          ), //text
                                        )
                                      ]);
                                    }).toList(),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ), //sp
                                  Text(
                                    "Age restriction",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .fontSize,
                                    ),
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
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                              fontSize: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .fontSize,
                                            ),
                                          ), //text
                                        )
                                      ]);
                                    }).toList(),
                                  ),
                                ],
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
