//fxh
import 'package:flutter/material.dart';

class LPaymentScreen extends StatelessWidget {
  final String contractId;
  const LPaymentScreen({super.key, this.contractId = ""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LPaymentScreen"),
      ),
      body: const Center(
        child: Text("Create Screen"),
      ),
    );
  }
}
