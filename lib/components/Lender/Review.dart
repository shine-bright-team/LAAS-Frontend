import 'package:flutter/material.dart';
import 'package:laas/components/Lender/Star.dart';

Widget review(BuildContext context) {
  return (Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Review",
        style: TextStyle(
            fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
            color: Theme.of(context).colorScheme.primary),
      ),
      const SizedBox(
        height: 20,
      ),
      Container(
        constraints: const BoxConstraints(maxWidth: 340, minHeight: 150),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context)
                  .colorScheme
                  .onPrimaryContainer
                  .withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Text("4.5",
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.displayLarge!.fontSize,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const StarDisplayWidget(
                      value: 4,
                      filledStar: Icon(Icons.star, color: Colors.yellow),
                      unfilledStar:
                          Icon(Icons.star_border, color: Colors.yellow),
                      key: null,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("357,268",
                        style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .fontSize,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  ));
}
