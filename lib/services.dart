import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:one/model.dart';

class StudentServices {
  CollectionReference storeData =
      FirebaseFirestore.instance.collection('oneset');

  Future<void> addDataToFireBase(StudentData datass) async {
    try {
      log('${datass.name}');
      await storeData.add(datass.ToFireStore());
    } catch (e) {
      log('$e');
    }
  }
}
