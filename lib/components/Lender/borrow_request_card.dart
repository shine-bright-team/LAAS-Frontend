import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BrRequestCard extends StatefulWidget {
  final String uId;
  final String cId;
  final String fName;
  final String lName;
  final double amount;
  final String profileId;
  const BrRequestCard(
      {super.key,
      required this.uId,
      required this.cId,
      required this.fName,
      required this.lName,
      required this.amount,
      required this.profileId});
  @override
  State<BrRequestCard> createState() => _LenderCardState();
}

class _LenderCardState extends State<BrRequestCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: InkWell(
            onTap: () => {context.push("/l/apporveloan/${widget.cId}")},
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
                          const CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage('assets/profile.jpeg'),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "${widget.fName}\n${widget.lName}",
                            style: TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .fontSize,
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Requested amount",
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
                            "${widget.amount}THB",
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
