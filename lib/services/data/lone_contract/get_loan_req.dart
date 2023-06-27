import 'package:intl/intl.dart';
import 'package:laas/services/api.dart';
import 'package:laas/services/data/agreement/get_agreement.dart';

Future<ApproveDetail?> getDetailReq(String id) async {
  try {
    final getdetail = await Api.dio.get("/lender/borrower/request/$id");

    if (getdetail.statusCode == 200) {
      final data = getdetail.data;
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
  final Review reviews;
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
        reviews: Review.fromJson(json['reviews']));
  }
}

class DebtAnalysis {
  final double paid;
  final double unpaid;

  const DebtAnalysis({
    required this.paid,
    required this.unpaid,
  });

  factory DebtAnalysis.fromJson(Map json) {
    return DebtAnalysis(
      paid: double.parse(json['paid'].toString()),
      unpaid: double.parse(json['unpaid'].toString()),
    );
  }
}
