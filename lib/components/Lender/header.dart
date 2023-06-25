import 'package:flutter/material.dart';

Widget header(BuildContext context, String? firstname, String? lastname,
    bool isProfile, String amount) {
  return Container(
    color: Theme.of(context).colorScheme.primary,
    height: 250,
    width: double.infinity,
    padding: const EdgeInsets.all(20.0),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  radius: 50.0,
                  child: const CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('assets/ri.jpeg'),
                  )),
              const SizedBox(width: 20),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$firstname",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize:
                            Theme.of(context).textTheme.titleLarge!.fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "$lastname",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize:
                            Theme.of(context).textTheme.titleLarge!.fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          if (isProfile)
            Flexible(
              child: Text("Amount Limit : $amount THB",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize:
                        Theme.of(context).textTheme.headlineSmall!.fontSize,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          if (!isProfile)
            Flexible(
              child: Text("Amount : $amount THB",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize:
                        Theme.of(context).textTheme.headlineSmall!.fontSize,
                    fontWeight: FontWeight.bold,
                  )),
            ),
        ]),
  );
}
