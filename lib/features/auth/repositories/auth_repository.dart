import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:edunation/constants/constants.dart';
import 'package:edunation/constants/utils.dart';
import 'package:edunation/features/auth/models/user.dart';
import 'package:edunation/features/options/screens/options_screen.dart';
import 'package:flutter/material.dart';

class AuthRepository {
  void signUp(BuildContext context, UserModel model) async {
    // sign up here

    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(
              email: model.email, password: model.password)
          .then((value) {
        userUid = firebaseAuth.currentUser?.uid ?? '';
        firestore
            .collection('users')
            .doc(firebaseAuth.currentUser?.uid ?? '')
            .set(model.toMap())
            .then((value) {
          showAwesomeSnackBar(context, ContentType.success, "Yayy!",
              "Yay! you are successfully signed up!");
          moveScreen(context, OptionsScreen());
        });
      });
    } catch (e) {
      print(e);
    }
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
