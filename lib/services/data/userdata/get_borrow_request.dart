import 'package:intl/intl.dart';
import 'package:laas/services/api.dart';

Future<List<BorrowReq>?> getBorrowRequest() async {
  try {
    final borrowReq = await Api.dio.get("/lender/borrower/request/");

    if (borrowReq.statusCode == 200) {
      final data = borrowReq.data;
      List<BorrowReq> response = List<Map<String, dynamic>>.from(data ?? [])
          .map((e) => BorrowReq.fromJson(e))
          .toList();
      return response;
    }
  } catch (err) {
    rethrow;
  }
  return null;
}

class BorrowReq {
  final int borrowId;
  final String username;
  final int userId;
  final String firstname;
  final String lastname;
  final int requestedAmount;
  final DateTime requestedAt;

  BorrowReq({
    required this.borrowId,
    required this.username,
    required this.userId,
    required this.firstname,
    required this.lastname,
    required this.requestedAmount,
    required this.requestedAt,
  });

  factory BorrowReq.fromJson(Map json) {
    return BorrowReq(
      borrowId: json['borrow_id'],
      username: json['username'],
      userId: json['user_id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      requestedAmount: json['requested_amount'],
      requestedAt: DateFormat("yyyy-MM-dd").parse(json['requested_at']),
    );
  }
}
