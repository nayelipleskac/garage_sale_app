import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import '../logic/auth.dart';

enum AuthMode { Signup, Login }

Auth authFunctions = Auth();

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';  

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  final GlobalKey<FormState> _formKey = GlobalKey();

  AuthMode _authMode = AuthMode.Login;

  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  var _isLoading = false;

  final emailAddressController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> _submit() async {
    // final enteredEmail = emailAddressController.text;
    // final enteredPassword = passwordController.text;

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

    if (_authMode == AuthMode.Login) {
      // Sign user in
      await signUserIn(
        _authData['email'],
        _authData['password'],
      );
    } else {
      // Sign user up
      await signUserUp(
        _authData['email'],
        _authData['password'],
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  //swithing between the mode
  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 45,
            ),
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
              height: 70,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // the email address text field
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: emailAddressController,
                      decoration: InputDecoration(labelText: 'Email Address'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value.isEmpty || !value.contains('@')) {
                          return 'Invalid email';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _authData['email'] = value;
                      },
                    ),
                  ),

                  // the password text field
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
                        return null;
                      },
                      onSaved: (value) {
                        _authData['password'] = value;
                      },
                    ),
                  ),
                  if (_authMode == AuthMode.Signup)
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        enabled: _authMode == AuthMode.Signup,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                        ),
                        obscureText: true,
                        validator: _authMode == AuthMode.Signup
                            ? (value) {
                                if (value != passwordController.text) {
                                  return 'Passwords do not match!';
                                }
                              }
                            : null,
                      ),
                    ),
                  SizedBox(
                    height: 55,
                  ),

                  if (_isLoading == true)
                    CircularProgressIndicator(
                      backgroundColor: Theme.of(context).primaryColor,
                    )
                  else
                    Container(
                      width: 300,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor),
                        child: Text(
                          _authMode == AuthMode.Login ? 'Login!' : 'Sign Up!',
                          style: TextStyle(fontSize: 15),
                        ),
                        onPressed: _submit,
                      ),
                    ),
                  TextButton(
                    onPressed: _switchAuthMode,
                    child: Text(
                      '${_authMode == AuthMode.Login ? 'Sign Up' : 'Login'} Instead!',
                      style: TextStyle(
                          fontSize: 17, color: Theme.of(context).primaryColor),
                    ),
                  ),
                  //the login button
                  // Container(
                  //   width: 300,
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       primary: Theme.of(context).primaryColor,
                  //     ),
                  //     onPressed: () async {
                  //       if (_authMode == AuthMode.Login) {
                  //         signUserIn(
                  //           emailAddressController,
                  //           passwordController,
                  //         );
                  //       } else {
                  //         signUserUp(
                  //           emailAddressController,
                  //           passwordController,
                  //         );
                  //       }
                  //     },
                  //     child: Text(
                  //       'Login',
                  //       style: TextStyle(fontSize: 15),
                  //     ),
                  //   ),
                  // ),
                  //
                  // the sign up button
                  // TextButton(
                  //   onPressed: () {
                  //     AuthMode.Signup == true;
                  //   },
                  //   child: Text('Sign Up Here!'),
                  // ),
                  // the google signin button
                  // TextButton(
                  //   onPressed: () {},
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Icon(
                  //         Icons.g_translate,
                  //         color: Colors.red,
                  //       ),
                  //       Text(
                  //         '    Google Sign In',
                  //         style: TextStyle(color: Colors.red, fontSize: 18),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
