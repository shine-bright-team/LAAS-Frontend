import 'dart:typed_data';

import 'package:laas/services/api.dart';

Future<void> postSignature(Uint8List image, int cid) async {
  try {
    await Api.dio.post('/lender/borrower/request/signature', data: {
      "contract_id": cid,
      "signature_image": image,
    });
  } catch (err) {
    rethrow;
  }
}
