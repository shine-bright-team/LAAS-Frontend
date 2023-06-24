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
  final Review userReview;
  final int active;
  final int salary;
  final String channel;
  final String number;
  Agreements({
    required this.userId,
    required this.id,
    required this.amountRange,
    required this.interestRate,
    required this.dueIn,
    required this.addition,
    required this.userReview,
    required this.active,
    required this.salary,
    required this.channel,
    required this.number,
  });

  factory Agreements.fromJson(Map json) {
    return Agreements(
      userId: json['UserId'],
      id: json['ID'],
      amountRange: json['AmountRange'],
      interestRate: json['InterestRate'],
      dueIn: json['DueIn'],
      addition: json['Addition'],
      userReview: Review.fromJson(json['review']),
      active: json['active_at_least'],
      salary: json['have_base_salary'],
      channel: json['payment_channel'],
      number: json['payment_number'],
    );
  }
}

class Review {
  final double reviewAverage;
  final int reviewCount;

  Review({
    required this.reviewAverage,
    required this.reviewCount,
  });

  factory Review.fromJson(Map json) {
    return Review(
      reviewAverage: json['review_average'],
      reviewCount: json['review_count'],
    );
  }
}
