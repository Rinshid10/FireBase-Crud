import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:one/model.dart';
import 'package:one/services.dart';

class StudentProvider extends ChangeNotifier {
  final TextEditingController name = TextEditingController();
  final TextEditingController age = TextEditingController();
  final StudentServices ser = StudentServices();
  List<StudentData> list = [];

  StudentProvider() {
    ser.getAllDataStream().listen((newData) {
      list = newData;
      notifyListeners();
    });
  }

  Future<void> addData() async {
    try {
      await ser.addDataToFirebase(StudentData(age: age.text, name: name.text));
      age.clear();
      name.clear();
    } catch (e) {
      log('Error adding data: $e');
    }
  }

  Future<void> deleteData(String id) async {
    try {
      await ser.deleteData(id);
    } catch (e) {
      log('Error deleting data: $e');
    }
  }

  /// Edits data in Firestore.
  Future<void> editData(String id, StudentData datass) async {
    try {
      await ser.updateData(id, datass);
    } catch (e) {
      log('Error editing data: $e');
    }
  }
}
