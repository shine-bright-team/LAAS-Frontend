import 'package:flutter/material.dart';

Widget header(
  BuildContext context,
) {
  return Container(
      color: Theme.of(context).colorScheme.primary,
      height: 250,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      radius: 55.0,
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/ri.jpeg'),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Name\nSurname",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize:
                            Theme.of(context).textTheme.headlineSmall!.fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Text("Amount Limit : ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize:
                        Theme.of(context).textTheme.headlineSmall!.fontSize,
                    fontWeight: FontWeight.bold,
                  )),
            ]),
      ));
}