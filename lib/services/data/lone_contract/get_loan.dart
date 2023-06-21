import 'package:intl/intl.dart';
import 'package:laas/services/api.dart';

//หมั่มๆ Home
// ดึง arara ออกมาจาก path "/lender/borrower" map value
// แก้ทุกสิ่งที่มันแดง จบ
Future<List<ContractRes>?> getContract() async {
  try {
    final contract = await Api.dio.get("/lender/borrower/");

    if (contract.statusCode == 200) {
      final data = contract.data;
      List<ContractRes> response = List<Map<String, dynamic>>.from(data ?? [])
          .map((e) => ContractRes.fromJson(e))
          .toList();
      return response;
    }
  } catch (err) {
    rethrow;
  }
  return null;
}

class ContractRes {
  final int borrowId;
  final String username;
  final int userId;
  final String firstname;
  final String lastname;
  final int requestedAmount;
  final int remainingAmount;
  final DateTime requestedAt;
  final DateTime dueDate;

  const ContractRes({
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

  factory ContractRes.fromJson(Map json) {
    return ContractRes(
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
