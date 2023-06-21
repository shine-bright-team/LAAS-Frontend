import 'package:flutter/material.dart';
import 'package:laas/components/Lender/com_star.dart';
import 'package:laas/config/theme/custom_color.g.dart';

Widget review(BuildContext context, double userReview) {
  return Column(
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
        constraints: const BoxConstraints(maxWidth: 576),
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
                  child: Text(userReview.toString(),
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.displayLarge!.fontSize,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StarDisplayWidget(
                      value: userReview.round(),
                      filledStar: Icon(Icons.star,
                          color: Theme.of(context)
                              .extension<CustomColors>()!
                              .star),
                      unfilledStar: Icon(Icons.star_border,
                          color: Theme.of(context)
                              .extension<CustomColors>()!
                              .star),
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
