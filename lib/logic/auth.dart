import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new2u_project/screens/product_overview_screen.dart';

class Auth {
  String _token;
  DateTime _expriyDate;
  String _userId;
}

//http request code

// Future<void> _authenticate(
//     String email, String password, String urlSegment) async {
//   final url =
//       'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyAWHZlNnnFo1P5QNoWBzwPJuzwKpg9_IN4';
//   final response = await http.post(
//     Uri.parse(url),
//     body: json.encode(
//       {
//         'email': email,
//         'password': password,
//         'returnSecureToken': true,
//       },
//     ),
//   );
//   print(json.decode(response.body));

//     try {
//   UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//     email: "barry.allen@example.com",
//     password: "SuperSecretPassword!"
//   );
// } on FirebaseAuthException catch (e) {
//   if (e.code == 'weak-password') {
//     print('The password provided is too weak.');
//   } else if (e.code == 'email-already-in-use') {
//     print('The account already exists for that email.');
//   }
// } catch (e) {
//   print(e);
// }

//signing user in
Future<void> signUserIn(String email, String password) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    // return e.message;
    print('e.message ' + e.message);
  } catch (err) {
    return 'unknown error- sign in';
  }
}

// signing user up
Future<String> signUserUp(String email, String password) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return 'success';
  } on FirebaseAuthException catch (e) {
    return e.message;
  } catch (err) {
    return 'unknown error- sign up';
  }
}
