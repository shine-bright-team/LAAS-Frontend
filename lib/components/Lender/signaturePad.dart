import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class SignaturePad extends StatefulWidget {
  final String contractId;
  const SignaturePad({super.key, required this.contractId});

  @override
  State<SignaturePad> createState() => _SignaturePadState();
}

class _SignaturePadState extends State<SignaturePad> {
  @override
  @override
  Widget build(BuildContext context) {
    GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                height: 200,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: Theme.of(context).colorScheme.error),
                    borderRadius: BorderRadius.circular(10.0)),
                child: SfSignaturePad(
                    key: _signaturePadKey,
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    strokeColor: Theme.of(context).colorScheme.primary,
                    minimumStrokeWidth: 1.0,
                    maximumStrokeWidth: 4.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: Theme.of(context).colorScheme.surface,
                    ),
                    child: Text('Clear',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .fontSize)),
                    onPressed: () {
                      _signaturePadKey.currentState?.clear();
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    child: Text('Approve Loan',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .fontSize)),
                    onPressed: () async {
                      if (_signaturePadKey.currentState != null) {
                        // save the signature as image
                        final signature = await _signaturePadKey.currentState
                            ?.toImage(pixelRatio: 3.0);
                        // ignore: use_build_context_synchronously
                        context.go('/l/payment/$widget.contractId');
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('approve successfully')),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
