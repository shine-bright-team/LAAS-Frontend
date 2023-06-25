import 'package:flutter/material.dart';
import 'package:laas/model/user_login_model.dart';
import 'package:laas/services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationService extends ChangeNotifier {
  UserCredential? user;
  SharedPreferences? prefs;
  bool isLoading = true;
//   String token =

  Future<void> initPrefs() async {
    final value = await SharedPreferences.getInstance();
    final String token = value.getString('token') ?? "";
    Api.setToken(token);
    prefs = value;
    isLoading = false;
    await getUser();
    notifyListeners();
  }

  Future<void> getUser() async {
    try {
      final userCredentialResponse = await Api.dio.get("/user/");
      if (userCredentialResponse.statusCode == 200) {
        final userCredentialData = userCredentialResponse.data;
        user = UserCredential.fromJson(userCredentialData);
        notifyListeners();
        return;
      }
    } catch (err) {
      notifyListeners();
      rethrow;
    }
  }

  Future<void> _saveToken(String token) async {
    prefs?.setString('token', token);
  }

  Future<void> login(String email, String password) async {
    try {
      final response = await Api.dio.post(
        "/auth/login",
        data: {"username": email, "password": password},
      );
      if (response.statusCode == 200) {
        final data = response.data;
        final token = data['token'];
        await _saveToken(token);
        Api.setToken(token);
        await getUser();
      }
      throw "Login failed";
    } catch (err) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      user = null;
      Api.setToken("");

      await prefs?.remove('token');
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> uploadkyc(
      String birthdate, String address, String idNumber) async {
    //code ที่นี่นะ อย่าไปที่อื่นไม่งั้นเค้าโกรธนะ
    try {
      final response = await Api.dio.post("/user/kyc", data: {
        "birthdate": birthdate,
        "address": address,
        "id_card": idNumber
      });

      if (response.statusCode == 200) {
        // await getUser();
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<void> signup(String email, String title, String fname, String lanme,
      String username, String password, bool isL) async {
    try {
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
        await _saveToken(token);
        Api.setToken(token);
        await getUser();
      }
    } catch (err) {
      rethrow;
    }
  }
}
