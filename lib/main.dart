import 'package:flutter/material.dart';

import 'screens/product_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New2U Thrift Garage Sale',
      theme: ThemeData(
        primaryColor: Colors.amber,
        accentColor: Colors.indigo,
        fontFamily: 'OpenSansCondensed',
       
      ),
      home: ProductOverviewScreen(),
    );
  }
}
