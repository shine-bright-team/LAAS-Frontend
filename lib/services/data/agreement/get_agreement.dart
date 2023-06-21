import 'package:laas/services/api.dart';

Future<Agreements?> getAgreement() async {
  try {
    final agreement = await Api.dio.get("/user/agreement/");

    if (agreement.statusCode == 200) {
      final data = agreement.data;
      final response = Agreements.fromJson(data);
      return response;
    }
  } catch (err) {
    rethrow;
  }
  return null;
}

class Agreements {
  final int userId;
  final int id;
  final String amountRange;
  final String interestRate;
  final int dueIn;
  final String addition;

  Agreements({
    required this.userId,
    required this.id,
    required this.amountRange,
    required this.interestRate,
    required this.dueIn,
    required this.addition,
  });

  factory Agreements.fromJson(Map json) {
    return Agreements(
        userId: json['UserId'],
        id: json['ID'],
        amountRange: json['AmountRange'],
        interestRate: json['InterestRate'],
        dueIn: json['DueIn'],
        addition: json['Addition']);
  }
}
