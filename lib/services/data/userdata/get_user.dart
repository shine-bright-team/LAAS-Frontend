import 'package:laas/model/user_model.dart';

Future<User> getUser() async {
  User mockupUserList = const User(
    id: 1,
    title: 'Mr.',
    firstname: 'John',
    lastname: 'Doe',
    email: 'johndoe@example.com',
    isLender: true,
  );
  return mockupUserList;
}
