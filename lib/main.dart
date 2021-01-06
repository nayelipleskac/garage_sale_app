import 'package:flutter/material.dart';
import 'package:new2u_project/widgets/product_item.dart';

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
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 52, 1),
                fontSize: 30,
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 52, 1),
                fontSize: 30,
              ),
              headline6: TextStyle(
                fontSize: 30,
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
      ),
      home: ProductOverviewScreen(),
    );
    
  }
}
