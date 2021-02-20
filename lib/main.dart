import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import './screens/all_listings_detail_screen.dart';
import './screens/add_product_screen.dart';
import './screens/all_listings_screen.dart';
import './screens/cart_screen.dart';
import './screens/take_picture_screen.dart';
import './screens/product_overview_screen.dart';
import './screens/add_product_screen_with_image.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  await Firebase.initializeApp();
  runApp(MyApp(firstCamera: firstCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription firstCamera;
  final XFile imgFile;
  MyApp({this.firstCamera, this.imgFile});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thrifty Garage',
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
                fontSize: 25,
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'Lato-Light',
                //fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
      ),
      home: AllListingsScreen(),
      routes: {
        CartScreen.routeName: (ctx) => CartScreen(),
        AllListingsScreen.routeName: (ctx) => AllListingsScreen(),
        AddProductScreen.routeName: (ctx) => AddProductScreen(),
        TakePictureScreen.routeName: (ctx) =>
            TakePictureScreen(camera: firstCamera),
        AddProductScreenWithImage.routeName: (ctx) =>
            AddProductScreenWithImage(imgFile),
        ProductOverviewScreen.routeName: (ctx) => ProductOverviewScreen(),
        AllListingsDetailScreen.routeName: (ctx) => AllListingsDetailScreen(),
      },
    );
  }
}
