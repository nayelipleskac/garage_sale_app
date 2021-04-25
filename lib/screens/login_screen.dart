import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import '../widgets/drawer.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  final GlobalKey<FormState> _formKey = GlobalKey();
  // AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  
  var _isLoading = false;
  final emailAddressController = TextEditingController();
  final passwordController = TextEditingController();

  void _submit() {
    if (!_formKey.currentState.validate()) {
      //Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Page',
          style: TextStyle(
            fontFamily: 'Lato-Light',
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Login',
                style: TextStyle(
                  fontFamily: 'Lato-Light',
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 120,
          ),
          Container(
            // color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: emailAddressController,
                decoration: InputDecoration(labelText: 'Email Address'),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: 300,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
              ),
              onPressed: () {},
              child: Text(
                'Login',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.g_translate,
                  color: Colors.red,
                ),
                Text(
                  '    Google Sign In',
                  style: TextStyle(color: Colors.red, fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
