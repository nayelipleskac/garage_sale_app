import 'package:flutter/material.dart';
import 'package:new2u_project/widgets/drawer.dart';

class AllListings extends StatelessWidget {
  static const routeName = '/all-listings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Listings'),
      ),
      drawer: MainDrawer(),
    );
  }
}
