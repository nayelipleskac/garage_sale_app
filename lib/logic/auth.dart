import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// signing user in
Future<void> signUserIn(TextEditingController emailAddressController,
    TextEditingController passwordController) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: "barry.allen@example.com", password: "SuperSecretPassword!");
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print(e);
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print(e);
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

//signing user up
Future<void> signUserUp(TextEditingController emailAddressController,
    TextEditingController passwordController) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: '', password: '');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print(e);
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print(e);
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}
