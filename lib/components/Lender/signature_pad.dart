import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laas/services/photo/convertimage.dart';
import 'package:laas/services/photo/post_signature.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class SignaturePad extends StatefulWidget {
  final String contractId;
  const SignaturePad({super.key, required this.contractId});

  @override
  State<SignaturePad> createState() => _SignaturePadState();
}

class _SignaturePadState extends State<SignaturePad> {
  late Uint8List signature;
  void _postsig(signaturePadKey) async {
    signaturePadKey.currentState?.toImage(pixelRatio: 3.0).then((value) {
      if (mounted) {
        setState(() async {
          signature = await convertImageToUint8List(value);
          await postSignature(signature, int.parse(widget.contractId));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<SfSignaturePadState> signaturePadKey = GlobalKey();

    return Scaffold(
      body: Column(
        children: [
          // Text("")
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border:
                      Border.all(color: Theme.of(context).colorScheme.error),
                ),
                child: SfSignaturePad(
                    key: signaturePadKey,
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
                    onPressed: () {
                      if (signaturePadKey.currentState != null) {
                        _postsig(signaturePadKey);
                        context.go('/l/payment/${widget.contractId}');
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
