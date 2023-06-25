import 'package:laas/services/api.dart';

Future<void> editagreement(
    String startinput,
    String endinput,
    double interest,
    bool interestper,
    String dueinput,
    String activeinput,
    String baseSalaryinput,
    String additionalAgreement,
    String paymentChannel,
    String paymentNumber) async {
  double start = startinput != "" ? double.parse(startinput) : 0.0;
  double end = endinput != "" ? double.parse(endinput) : 0.0;
  int due = dueinput != "" ? int.parse(dueinput) : 0;
  int baseSalary = baseSalaryinput != "" ? int.parse(baseSalaryinput) : 0;
  int active = activeinput != "" ? int.parse(activeinput) : 0;
  try {
    await Api.dio.patch("/lender/", data: {
      "start_amount": start,
      "end_amount": end,
      "interest": interest,
      "due_with_in": due,
      "active_at_least": active,
      "base_salary": baseSalary,
      "additional_agreement": additionalAgreement,
      "payment_channel": paymentChannel,
      "payment_number": paymentNumber,
      "is_interest_per_month": interestper,
    });
    return;
  } catch (err) {
    rethrow;
  }
}
