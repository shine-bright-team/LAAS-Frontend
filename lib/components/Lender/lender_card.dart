import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LenderCard extends StatefulWidget {
  final String id;
  final String name;
  final String date;
  final String amount;
  final String profileId;
  const LenderCard(
      {super.key,
      required this.id,
      required this.name,
      required this.date,
      required this.amount,
      required this.profileId});
  @override
  State<LenderCard> createState() => _LenderCardState();
}

class _LenderCardState extends State<LenderCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: InkWell(
            onTap: () => {context.push("/l/loanstatus")},
            child: Container(
              constraints: const BoxConstraints(maxWidth: 350, minHeight: 115),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                color: Theme.of(context).colorScheme.onPrimary,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimaryContainer
                        .withOpacity(0.25),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(1, 1),
                  ),
                ],
              ),
              child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Thamolwan\nJarungrattanapong",
                            style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .fontSize,
                                color: Theme.of(context).colorScheme.primary),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Due date: 25 JUL 2023",
                            style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .fontSize,
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                          Text(
                            "Remaing",
                            style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .fontSize,
                                color: Theme.of(context).colorScheme.secondary),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "1000 THB",
                            style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontSize,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ],
                      )
                    ],
                  )),
            )));
  }
}
