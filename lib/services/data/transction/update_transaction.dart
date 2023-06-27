import 'package:laas/services/api.dart';

Future<void> updateTransaction(
    int transId, bool isApproved, String? errorMessage) async {
  try {
    Api.dio.patch("/lender/debt/transaction/", data: {
      "transaction_id": transId,
      "is_approved": isApproved,
      "error_message": errorMessage
    });
  } catch (err) {
    rethrow;
  }
}
