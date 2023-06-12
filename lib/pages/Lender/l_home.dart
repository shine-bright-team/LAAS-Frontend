//phon
import 'package:flutter/material.dart';
import '../../components/Lender/lender_card.dart';

class LHome extends StatelessWidget {
  const LHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Home",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                const SizedBox(height: 20),
                Text(
                  "Your borrowers",
                  style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.headlineMedium!.fontSize,
                      color: Theme.of(context).colorScheme.primary),
                  textAlign: TextAlign.end,
                ),
                const SizedBox(height: 10),
                const LenderCard(
                    id: "01",
                    name: "Thanaphon",
                    date: "test",
                    amount: "100",
                    profileId: "test"),
                const LenderCard(
                    id: "01",
                    name: "Thanaphon",
                    date: "test",
                    amount: "100",
                    profileId: "test"),
                const SizedBox(height: 20),
                Text(
                  "Borrow requests",
                  style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.headlineMedium!.fontSize,
                      color: Theme.of(context).colorScheme.primary),
                  textAlign: TextAlign.end,
                ),
                const SizedBox(height: 10),
              ])),
        ));
  }
}
