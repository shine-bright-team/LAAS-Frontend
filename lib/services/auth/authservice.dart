import 'package:laas/model/user_login_model.dart';
import 'package:laas/model/user_model.dart';
import 'package:laas/services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<UserCredential?> get user async {
    final user = (await Api.dio.get("/user/")) as UserCredential;
    if (user == null) {
      return null;
    }
    return UserCredential(userId: user.userId, isLender: user.isLender);
  }

  Future<bool> login(String email, String password) async {
    try {
      final response = await Api.dio.post(
        "/auth/login",
        data: {"username": email, "password": password},
      );
      if (response.statusCode == 200) {
        final data = response.data;
        final token = data['token'];
        Api.setToken(token);
        return true;
      } else {
        return false;
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<void> googleLogin() async {}

  Future<void> microsoftLogin() async {}

  Future<void> appleLogin() async {}

  Future<bool> signup(String email, String title, String fname, String lanme,
      String username, String password, bool isL) async {
    final response = await Api.dio.post("/auth/register", data: {
      "email": email,
      "title": title,
      "firstname": fname,
      "lastname": lanme,
      "username": username,
      "password": password,
      "isLender": isL
    });
    if (response.statusCode == 200) {
      final data = response.data;
      final token = data['token'];
      Api.setToken(token);
      return true;
    } else {
      return false;
    }
  }
}
