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

    return SingleChildScrollView(
      child: Column(children: [
        Image.asset("hourglass.png"),
        const SizedBox(height: 25),
        const Text("Please wait for the verification.\nSee you soon!"),
        Align(
          alignment: Alignment.bottomCenter,
          child: FilledButton(
              onPressed: () async {
                try {
                  await counter.logout();
                } catch (err) {
                  rethrow;
                }
              },
              child: const Text("Log out")),
        )
      ]),
    );
  }
}
