import 'package:laas/services/api.dart';

Future<void> createlone(
    double start,
    double end,
    double interest,
    int due,
    int baseSalary,
    int active,
    String additionalAgreement,
    String paymentChannel,
    String paymentNumber) async {
  try {
    final respone = await Api.dio.post("/lender/", data: {
      "start_amount": start,
      "end_amount": end,
      "interest": interest,
      "due_with_in": due,
      "active_at_least": active,
      "base_salary": baseSalary,
      "additional_agreement": additionalAgreement,
      "payment_channel": paymentChannel,
      "payment_number": paymentNumber
    });
  } catch (err) {
    rethrow;
  }

  return;
}
