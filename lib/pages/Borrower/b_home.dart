//phon
import 'package:flutter/material.dart';

class BHome extends StatelessWidget {
  const BHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: const Center(
        child: Text("Create Screen"),
      ),
    );
  }
}
