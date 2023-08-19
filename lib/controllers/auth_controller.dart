import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class AuthController {
  //Sign Out User
  static Future<void> signOutUser() async {
    await FirebaseAuth.instance.signOut();
  }

  //Signin Into User Account
  static Future<void> signIntoAccount(
      {required String emailAddress, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Logger().i('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Logger().i('Wrong password provided for that user.');
      }
    }
  }

  //Create User Account with Email and Paasword
  Future<void> createUserAccount(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        addUser(value.user!.uid, name, email);
      });

      Logger().i(credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Logger().e('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Logger().e('The account already exists for that email.');
      } else if (e.code == "invalid-email") {
        Logger().e("Invalid Email");
      } else if (e.code == "operation-not-allowed") {
        Logger().e("operation-not-allowed");
      }
    } catch (e) {
      Logger().e(e);
    }
  }

  //Send Password Reset email
  static Future<void> sendPasswordResetEmail(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    Logger().i("Email send");
  }

  //Save User Data
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(String uid, String name, String email) {
    return users
        .doc(uid)
        .set({
          'name': name,
          'userImage':
              "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",
          'uid': uid,
          'email': email
        })
        .then((value) => Logger().i("User Added"))
        .catchError((error) => Logger().i("Failed to add user: $error"));
  }
}
