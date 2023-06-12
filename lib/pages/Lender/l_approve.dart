//FXH
import 'package:flutter/material.dart';

class LApprove extends StatelessWidget {
  final String contractId;
  const LApprove({super.key, this.contractId = ""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LApprove"),
      ),
      body: const Center(
        child: Text("Create Screen"),
      ),
    );
  }
}
