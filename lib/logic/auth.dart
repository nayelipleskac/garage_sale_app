import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth {
  String _token;
  DateTime _expriyDate;
  String _userId;
}

//signing user up
Future<void> signUserUp(String email, String password) async {
  final url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyAWHZlNnnFo1P5QNoWBzwPJuzwKpg9_IN4';
  final response = await http.post(
    Uri.parse(url),
    body: json.encode(
      {
        'email': email,
        'password': password,
        'returnSecureToken': true,
      },
    ),
  );
  print(json.decode(response.body));
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

// signing user in
Future<void> signUserIn(String email, String password) async {
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
