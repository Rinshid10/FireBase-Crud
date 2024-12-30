import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginServices {
  FirebaseAuth auth = FirebaseAuth.instance;

  registerUser({required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await verifyEmail();

      log('register succefull');
    } on FirebaseAuthException catch (e) {
      log('error to register  ${e.message} ');
    }
  }

  loginuser({required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      log('suuces to login');
    } on FirebaseAuthException catch (e) {
      log('erro to login $e');
      throw Exception(e.message);
    }
  }

  verifyEmail() async {
    try {
      await auth.currentUser?.sendEmailVerification();
      log('varifiction send');
    } on FirebaseAuthException catch (e) {
      log('error to send verification $e');
    }
  }
}
