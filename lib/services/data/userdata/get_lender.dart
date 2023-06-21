import 'package:laas/model/user_model.dart';

Future<List<User>> getLender() async {
  List<User> mockupUserList = [
    const User(
        id: 1,
        title: 'Mr.',
        firstname: 'John',
        lastname: 'Doe',
        email: 'johndoe@example.com',
        isLender: true,
        paychannel: "Kbank",
        payNumber: "123-456-789-0"),
    const User(
        id: 2,
        title: 'Ms.',
        firstname: 'Jane',
        lastname: 'Smith',
        email: 'janesmith@example.com',
        isLender: true,
        paychannel: "Promptpay",
        payNumber: "0962200825"),
    const User(
        id: 3,
        title: 'Dr.',
        firstname: 'Michael',
        lastname: 'Johnson',
        email: 'michaeljohnson@example.com',
        isLender: true,
        paychannel: "Kbank",
        payNumber: "123-456-789-0"),
    const User(
        id: 4,
        title: 'Mrs.',
        firstname: 'Emily',
        lastname: 'Williams',
        email: 'emilywilliams@example.com',
        isLender: true,
        paychannel: "Kbank",
        payNumber: "123-456-789-0"),
  ];
  return mockupUserList;
}
