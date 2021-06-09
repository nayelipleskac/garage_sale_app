import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../screens/all_listings_screen.dart';

class VerifyScreen extends StatefulWidget {
  static const routeName = '/verify-screen';
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final auth = FirebaseAuth.instance;
  User user;
  Timer timer;

  @override
  void initState() {
    user = auth.currentUser;
    user.sendEmailVerification();
    print('verify screen current user ' + user.email + ' ' + user.emailVerified.toString());

    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.of(context).pushNamed(AllListingsScreen.routeName);
    }
    if (!user.emailVerified) {
      print('something has gone wrong, user is not email verified');
    }
  }

  @override
  void dispose() {
    // dispose widget 
    timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child:
                Text('An email has been sent to ${user.email} please verify'),
          ),
        ),
      ),
    );
  }
}
