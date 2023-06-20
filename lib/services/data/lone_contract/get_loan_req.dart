import 'package:intl/intl.dart';
import 'package:laas/services/api.dart';

Future<ApproveDetail?> getDetailReq(String id) async {
  try {
    final getdetail = await Api.dio.get("/lender/borrower/request/$id");

    if (getdetail.statusCode == 200) {
      final data = getdetail.data;
      print(data);
      ApproveDetail res = ApproveDetail.fromJson(data);
      return res;
    }
  } catch (err) {
    rethrow;
  }
  return null;
}

class ApproveDetail {
  final int borrowId;
  final String username;
  final int userId;
  final String firstname;
  final String lastname;
  final double requestedAmount;
  final double? remainingAmount;
  final DateTime requestedAt;
  // final DateTime? dueDate;
  final String payChannel;
  final String payNumber;
  final DebtAnalysis debtAnalysis;
  final Reviews reviews;
  ApproveDetail({
    required this.borrowId,
    required this.username,
    required this.userId,
    required this.firstname,
    required this.lastname,
    required this.requestedAmount,
    required this.remainingAmount,
    required this.requestedAt,
    // required this.dueDate,
    required this.payChannel,
    required this.payNumber,
    required this.debtAnalysis,
    required this.reviews,
  });
  factory ApproveDetail.fromJson(Map json) {
    return ApproveDetail(
        borrowId: json['borrow_id'],
        username: json['username'],
        userId: json['user_id'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        requestedAmount: json['requested_amount'],
        remainingAmount: json['remaining_amount'],
        requestedAt: DateFormat("yyyy-MM-dd").parse(json['requested_at']),
        // dueDate: DateFormat("yyyy-MM-dd").parse(json['due_date']),
        payChannel: json['pay_channel'],
        payNumber: json['pay_number'],
        debtAnalysis: DebtAnalysis.fromJson(json['debt_analysis']),
        reviews: Reviews.fromJson(json['reviews']));
  }
}

class DebtAnalysis {
  final int paid;
  final int unpaid;

  const DebtAnalysis({
    required this.paid,
    required this.unpaid,
  });

  factory DebtAnalysis.fromJson(Map json) {
    return DebtAnalysis(
      paid: json['paid'],
      unpaid: json['unpaid'],
    );
  }
}

class Reviews {
  final int average;
  final int count;

  const Reviews({
    required this.average,
    required this.count,
  });

  factory Reviews.fromJson(Map json) {
    return Reviews(
      average: json['review_average'],
      count: json['review_count'],
    );
  }
}
