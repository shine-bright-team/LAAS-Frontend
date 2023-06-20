import 'package:flutter/material.dart';

Widget agreement(
    BuildContext context, String? interestRate, int? dueIn, String? addition) {
  return (Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Agreement",
        style: TextStyle(
            fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
            color: Theme.of(context).colorScheme.primary),
      ),
      const SizedBox(
        height: 20,
      ),
      Container(
        constraints: const BoxConstraints(maxWidth: 576),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          color: Theme.of(context).colorScheme.surface,
          // boxShadow: [
          //   BoxShadow(
          //     color: Theme.of(context)
          //         .colorScheme
          //         .onPrimaryContainer
          //         .withOpacity(0.2),
          //     spreadRadius: 3,
          //     blurRadius: 7,
          //     offset: const Offset(0, 1),
          //   ),
          // ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                Text(
                    "• Interest rate : $interestRate \n• Pay within $dueIn months\n• $addition  ",
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.titleLarge!.fontSize,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    )),
              ],
            ),
          ),
        ),
      ),
    ],
  ));
}
