import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laas/components/kyc_pageone.dart';

class Kyc extends ConsumerStatefulWidget {
  const Kyc({super.key});

  @override
  ConsumerState<Kyc> createState() => _KycState();
}

class _KycState extends ConsumerState<Kyc> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  late double _page = 0;
  bool _isLoading = false;

  void setLoading(bool isLoading) {
    setState(() {
      _isLoading = isLoading;
    });
  }

  @override
  void initState() {
    _page = 0.34;
    super.initState();
  }

  void login() {}

  void pagecontroll() {
    setState(() {
      _page = _page + 0.33;
    });
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Expanded(
                child: Container(
              margin: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            LinearProgressIndicator(
                              value: _page,
                              semanticsLabel: 'Linear progress indicator',
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Kycpageone(),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 150),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: [
                              const Expanded(child: SizedBox()),
                              Expanded(
                                child: FilledButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                    ),
                                    onPressed: () {
                                      pagecontroll();
                                    },
                                    child: Text(
                                      'Next',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
