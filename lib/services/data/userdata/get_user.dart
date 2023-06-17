import 'package:laas/model/user_model.dart';

//หมั่ม Profile
// ดึงuser ออกมา ผ่าน route "/user/ return ออกไป"
// แก้ทุกสิ่งที่มันแดง
Future<User> getUser() async {
  User mockupUserList = const User(
      id: 1,
      title: 'Mr.',
      firstname: 'John',
      lastname: 'Doe',
      email: 'johndoe@example.com',
      isLender: true,
      paychannel: "Promptpay",
      payNumber: "0962200825");
  return mockupUserList;
}
