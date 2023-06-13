import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:laas/config/theme/custom_text_fied.dart';
import 'package:laas/config/theme/custom_warpper.dart';

class Kyc extends ConsumerStatefulWidget {
  const Kyc({super.key});

  @override
  ConsumerState<Kyc> createState() => _KycState();
}

class _KycState extends ConsumerState<Kyc> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  late double _page = 0;
  bool _isShowPassword = false;
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
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Linear progress indicator with a fixed color',
                  style: TextStyle(fontSize: 20),
                ),
                LinearProgressIndicator(
                  value: _page,
                  semanticsLabel: 'Linear progress indicator',
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: FilledButton(
                    onPressed: () {
                      pagecontroll();
                    },
                    style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      padding: const EdgeInsets.all(10.00),
                    ),
                    child: Text(_isLoading ? "Loading" : "Next"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
