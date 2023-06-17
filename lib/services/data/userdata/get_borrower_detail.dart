import 'package:laas/model/user_model.dart';
import 'package:laas/services/data/userdata/get_borrower.dart';

Future<User?> getBorrowerDetail(int id) async {
  List<User> data = await getBorrower();
  User? res;
  for (int i = 0; i < data.length; i++) {
    if (data[i].id == id) {
      res = data[i];
    }
  }
  return res;
}
