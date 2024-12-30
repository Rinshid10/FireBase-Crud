import 'package:flutter/material.dart';
import 'package:one/services/LoginAndSignUpSer.dart/services.dart';

class Userprovider extends ChangeNotifier {
  TextEditingController registerEmail = TextEditingController();
  TextEditingController registerpassword = TextEditingController();
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginpassword = TextEditingController();
  var errorMesage = '';

  LoginServices ser = LoginServices();

  void register() async {
    try {
      await ser.registerUser(
          email: registerEmail.text, password: registerpassword.text);
      notifyListeners();
    } catch (e) {
      errorMesage = 'Registration failed: $e';
      notifyListeners();
    }
  }

  void login() async {
    try {
      await ser.loginuser(email: loginEmail.text, password: loginpassword.text);
      notifyListeners();
    } catch (e) {
      errorMesage = 'Login failed: $e';
      notifyListeners();
    }
  }
}
