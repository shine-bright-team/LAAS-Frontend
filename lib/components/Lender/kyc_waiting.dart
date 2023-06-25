import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laas/providers/authProvider.dart';

class KycWaiting extends ConsumerStatefulWidget {
  const KycWaiting({super.key});

  @override
  ConsumerState<KycWaiting> createState() => _KycWaitingState();
}

class _KycWaitingState extends ConsumerState<KycWaiting> {
  @override
  Widget build(BuildContext context) {
    final counter = ref.watch(authProvider);

    return Scaffold(
      body: Stack(children: [
        Center(
          child: SingleChildScrollView(
            child: Column(children: [
              Image.asset(
                "assets/hourglass.png",
                width: 131,
                height: 131,
              ),
              const SizedBox(height: 25),
              Text(
                "Please wait for the verification.",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
                ),
              ),
              Text(
                "See you soon!",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
                ),
              ),
            ]),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: FilledButton(
                      onPressed: () async {
                        try {
                          await counter.logout();
                        } catch (err) {
                          rethrow;
                        }
                      },
                      child: const Text("Log out")),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
