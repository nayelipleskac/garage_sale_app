import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  static const routeName = '/add-product';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add a Product',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Add an Item to Your Garage',
                style: TextStyle(
                  fontSize: 27,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
