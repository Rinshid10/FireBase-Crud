import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:one/model.dart';

class StudentServices {
  final CollectionReference storeData =
      FirebaseFirestore.instance.collection('oneset');

  Future<void> addDataToFirebase(StudentData data) async {
    try {
      log('Adding data: ${data.name}');
      await storeData.add(data.ToFireStore());
    } catch (e) {
      log('Error adding data: $e');
    }
  }

  Future<void> updateData(String id, StudentData data) async {
    try {
      await storeData.doc(id).update(data.ToFireStore());
      log('Updated data with id: $id');
    } catch (e) {
      log('Error updating data: $e');
    }
  }

  Future<void> deleteData(String id) async {
    try {
      await storeData.doc(id).delete();
      log('Deleted data with id: $id');
    } catch (e) {
      log('Error deleting data: $e');
    }
  }

  Stream<List<StudentData>> getAllDataStream() {
    return storeData.snapshots().map((snapshot) => snapshot.docs
        .map((doc) =>
            StudentData.fromfireStore(doc.data() as Map<String, dynamic>))
        .toList());
  }
}
