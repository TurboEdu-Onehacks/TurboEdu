import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:edunation/constants/constants.dart';
import 'package:edunation/constants/utils.dart';
import 'package:edunation/features/auth/models/user.dart';
import 'package:flutter/material.dart';

class AuthRepository {
  void signUp(BuildContext context, UserModel model) {
    // sign up here

    firebaseAuth
        .createUserWithEmailAndPassword(
            email: model.email, password: model.password)
        .then((value) {
      uid = firebaseAuth.currentUser?.uid ?? '';
      firestore.collection('users').doc(uid).set(model.toMap());

      showAwesomeSnackBar(context, ContentType.success, "Yayy!",
          "Yay! you are successfully signed up!");
    });
  }

  void login(BuildContext context, String email, String pass) {
    firebaseAuth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((value) {
      showAwesomeSnackBar(context, ContentType.success, "Yayy!",
          "Yay! you are successfully logged in!");
    });
  }
}
