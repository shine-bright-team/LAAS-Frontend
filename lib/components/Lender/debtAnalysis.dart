import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/theme/custom_color.g.dart';

Widget debtAnalysisBox(BuildContext context, String pain, String unpaid) {
  return Row(
    children: [
      Expanded(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 576),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19),
            color: Theme.of(context)
                .colorScheme
                .secondaryContainer
                .withOpacity(0.6),
          ),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Debt Analysis",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .fontSize),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width <= 350
                                  ? 100
                                  : 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Theme.of(context)
                                    .extension<CustomColors>()!
                                    .neutralVaraint,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        unpaid,
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .extension<CustomColors>()!
                                                .sourceRedbar,
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width <=
                                                    350
                                                ? Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .fontSize
                                                : Theme.of(context)
                                                    .textTheme
                                                    .headlineMedium!
                                                    .fontSize),
                                      ),
                                      Text(
                                        "THB",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .extension<CustomColors>()!
                                                .sourceRedbar,
                                            fontWeight: FontWeight.bold,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .fontSize),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ]),
                      const SizedBox(height: 2),
                      Text("Unpaid",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Container(
                      constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.03,
                  )),
                  Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width <= 350
                                  ? 100
                                  : 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Theme.of(context)
                                    .extension<CustomColors>()!
                                    .neutralVaraint,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        pain,
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .extension<CustomColors>()!
                                                .sourceGreenbar,
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width <=
                                                    350
                                                ? Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .fontSize
                                                : Theme.of(context)
                                                    .textTheme
                                                    .headlineMedium!
                                                    .fontSize),
                                      ),
                                      Text(
                                        "THB",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .extension<CustomColors>()!
                                                .sourceGreenbar,
                                            fontWeight: FontWeight.bold,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .fontSize),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ]),
                      const SizedBox(height: 2),
                      Text("Paid",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    ],
  );
}
