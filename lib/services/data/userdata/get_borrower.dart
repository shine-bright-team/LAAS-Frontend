import 'package:laas/model/user_model.dart';

Future<List<User>> getBorrower() async {
  List<User> mockupUserList = [
    const User(
      id: 5,
      title: 'Mr.',
      firstname: 'David',
      lastname: 'Brown',
      email: 'davidbrown@example.com',
      isLender: true,
    ),
    const User(
      id: 6,
      title: 'Ms.',
      firstname: 'Sophia',
      lastname: 'Davis',
      email: 'sophiadavis@example.com',
      isLender: true,
    ),
    const User(
      id: 7,
      title: 'Dr.',
      firstname: 'Oliver',
      lastname: 'Wilson',
      email: 'oliverwilson@example.com',
      isLender: true,
    ),
    const User(
      id: 8,
      title: 'Mrs.',
      firstname: 'Emma',
      lastname: 'Anderson',
      email: 'emmaanderson@example.com',
      isLender: true,
    ),
  ];

  return mockupUserList;
}
