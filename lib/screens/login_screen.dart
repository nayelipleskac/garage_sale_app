import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login-screen';
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
              child: TextField(
                decoration: InputDecoration(labelText: 'Email Address'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'Password'),
            ),
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
          FlatButton(onPressed: () {}, child: Text('google'))
        ],
      ),
    );
  }
}
