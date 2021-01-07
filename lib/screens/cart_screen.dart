import 'package:flutter/material.dart';
import 'package:new2u_project/widgets/drawer.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      drawer: MainDrawer(),
    );
  }
}
