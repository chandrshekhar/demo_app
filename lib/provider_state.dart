import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviderState extends ChangeNotifier {
  String uid = "";
  String email = "";
  String get getUid => uid;
  // String get getEmail => email;

  Future<bool> signUpUser(String email, String password) async {
    bool retval = false;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    if (prefs.getString('email')!.isNotEmpty ||
        prefs.getString('password')!.isNotEmpty) {
      return retval = true;
    }

    return retval;
  }

  // ignore: non_constant_identifier_names
  Future<bool> LoginUser(String email, String password) async {
    bool retval = false;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? _email = prefs.getString('email');
    String? _pass = prefs.getString('password');

    if (_email == email && _pass == password) {
      return retval = true;
    }

    return retval;
  }

  void setUid(String text) {
    uid = text;
  }
}
