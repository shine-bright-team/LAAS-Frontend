import 'package:intl/intl.dart';
import 'package:laas/model/transaction.dart';
import 'package:laas/services/api.dart';

Future<DetailLone?> getDetail(String id) async {
  try {
    final getdetail = await Api.dio.get("/lender/debt/$id");

    if (getdetail.statusCode == 200) {
      final data = getdetail.data;
      print(data);
      DetailLone res = DetailLone.fromJson(data);
      print(res);
      return res;
    }
  } catch (err) {
    rethrow;
  }
  return null;
}

class DetailLone {
  final Detail detail;
  final List<Transactions> transactions;

  const DetailLone({
    required this.detail,
    required this.transactions,
  });

  factory DetailLone.fromJson(Map json) {
    return DetailLone(
        detail: Detail.fromJson(json['debt_detail']),
        transactions:
            List<Map<String, dynamic>>.from(json['transactions'] ?? [])
                .map((e) => Transactions.fromJson(e))
                .toList());
  }
}

class Detail {
  final int borrowId;
  final String username;
  final int userId;
  final String firstname;
  final String lastname;
  final double requestedAmount;
  final double remainingAmount;
  final DateTime requestedAt;
  final DateTime dueDate;
  Detail({
    required this.borrowId,
    required this.username,
    required this.userId,
    required this.firstname,
    required this.lastname,
    required this.requestedAmount,
    required this.remainingAmount,
    required this.requestedAt,
    required this.dueDate,
  });
  factory Detail.fromJson(Map json) {
    return Detail(
      borrowId: json['borrow_id'],
      username: json['username'],
      userId: json['user_id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      requestedAmount: json['requested_amount'],
      remainingAmount: json['remaining_amount'],
      requestedAt: DateFormat("yyyy-MM-dd").parse(json['requested_at']),
      dueDate: DateFormat("yyyy-MM-dd").parse(json['due_date']),
    );
  }
}

class Transactions {
  final int id;
  final int paidAmount;
  final DateTime paidAt;
  final String? errMessage;
  final bool isApproved;
  final String status;

  const Transactions({
    required this.id,
    required this.paidAmount,
    required this.paidAt,
    required this.errMessage,
    required this.isApproved,
    required this.status,
  });

  factory Transactions.fromJson(Map json) {
    return Transactions(
      id: json['id'],
      paidAmount: json['paid_amount'],
      paidAt: DateFormat("yyyy-MM-dd").parse(json['paid_at']),
      errMessage: json['error_message'],
      isApproved: json['is_approved'],
      status: json['status'],
    );
  }
}
