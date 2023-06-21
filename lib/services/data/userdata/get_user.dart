import 'package:laas/services/api.dart';

//หมั่ม Profile
// ดึงuser ออกมา ผ่าน route "/user/ return ออกไป"
// แก้ทุกสิ่งที่มันแดง
Future<UserRes?> getUser() async {
  try {
    final user = await Api.dio.get("/user/");

    if (user.statusCode == 200) {
      final data = user.data;
      UserRes response = UserRes.fromJson(data);
      return response;
    }
  } catch (err) {
    rethrow;
  }
  return null;
}

class UserRes {
  final int id;
  final bool isKyc;
  final String username;
  final String firstname;
  final String lastname;
  final String email;
  final bool isLender;

  UserRes({
    required this.id,
    required this.isKyc,
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.isLender,
  });

  factory UserRes.fromJson(Map json) {
    return UserRes(
      id: json['id'],
      isKyc: json['is_kyc'],
      username: json['username'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      isLender: json['is_lender'],
    );
  }
}
