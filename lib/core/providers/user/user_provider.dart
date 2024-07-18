import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pingolearn/widgets/custom_widgets/custom_snackbar.dart';

class UserNotifier extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> login({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed("/home");
    } catch (e) {
      String? errorMessage;
      if(e.toString().contains("[firebase_auth/wrong-password]")){
        errorMessage = e.toString().replaceAll("[firebase_auth/wrong-password]",
            "");
      }
      errorSnackBar(error: errorMessage);
      // Handle error
    }
  }

  Future<void> signUp({required String email, required String password, required String name}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password).then((result) {
        FirebaseFirestore.instance.collection('users').doc(result.user?.uid).set({
          "name": name,
          "email": email,
        }).then((_) {
          Get.offAllNamed("/home");
        });
      });
    } catch (e) {
      String? errorMessage;
      if(e.toString().contains("[firebase_auth/wrong-password]")){
        errorMessage = e.toString().replaceAll("[firebase_auth/wrong-password]",
            "");
      }
      errorSnackBar(error: errorMessage);
      // Handle error
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
