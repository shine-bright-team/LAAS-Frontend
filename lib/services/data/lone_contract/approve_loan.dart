import 'package:laas/services/api.dart';

Future<void> approveLoan(int cid) async {
  try {
    Api.dio.patch("/lender/borrower/request", data: {
      "contract_id": cid,
      "is_approved": true,
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
