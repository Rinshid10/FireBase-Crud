import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:one/model.dart';
import 'package:one/services.dart';

class StudentProvider extends ChangeNotifier {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  StudentServices ser = StudentServices();
  void adddata() async {
    try {
      ser.addDataToFireBase(StudentData(age: age.text, name: name.text));
      notifyListeners();
      age.clear();
      name.clear();
    } catch (e) {
      log('$e');
    }
  }
}
