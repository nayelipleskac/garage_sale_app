import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import '../widgets/drawer.dart';
import '../logic/auth.dart';

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

    auth.authStateChanges().listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });

    // if (_authMode == AuthMode.Login) {
    //   // Log user in
    // } else {
    //   // Sign user up
    // }
    //
    setState(() {
      _isLoading = false;
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
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    // color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        controller: emailAddressController,
                        decoration: InputDecoration(labelText: 'Email Address'),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value.isEmpty || !value.contains('@')) {
                            return 'Invalid email';
                          }
                        },
                        onSaved: (value) {
                          _authData['email'] = value;
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      validator: (value) {
                        if (value.isEmpty || value.length < 5) {
                          return 'Password is too short';
                        }
                      },
                      onSaved: (value) {
                        _authData['password'] = value;
                      },
                    ),
                    // if authMode == AuthMode.Signup
                  ),
                ],
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
              onPressed: () async {
                signUserIn(emailAddressController, passwordController);
              },
              child: Text(
                'Login',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          TextButton(onPressed: () {}, child: Text('Sign Up Here!')),
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
