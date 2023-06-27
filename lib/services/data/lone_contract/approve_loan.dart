import 'package:image_picker/image_picker.dart';
import 'package:laas/services/api.dart';
import 'package:flutter/foundation.dart';

Future<void> approveLoan(int cid, XFile file) async {
  final Uint8List fileData = await file.readAsBytes();
  try {
    Api.dio.patch("/lender/borrower/request", data: {
      "contract_id": cid,
      "is_approved": true,
      "transaction_image": fileData
    });
  } catch (err) {
    rethrow;
  }
}

Future<void> declineLoan(int cid) async {
  try {
    Api.dio.patch("/lender/borrower/request", data: {
      "contract_id": cid,
      "is_approved": false,
    });
  } catch (err) {
    rethrow;
  }
}
