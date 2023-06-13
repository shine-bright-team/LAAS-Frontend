//phon
import 'package:flutter/material.dart';

class LLoanStatus extends StatelessWidget {
  final String contractId;
  const LLoanStatus({super.key, this.contractId = ""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LProfileScreen"),
      ),
      body: const Center(
        child: Text("Create Screen"),
      ),
    );
  }
}
