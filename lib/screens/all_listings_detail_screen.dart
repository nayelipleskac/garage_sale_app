import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../screens/cart_screen.dart';
import '../models/product.dart';

class AllListingsDetailScreen extends StatefulWidget {
  static const routeName = '/all-listings-detail-screen';

  @override
  _AllListingsDetailScreenState createState() => _AllListingsDetailScreenState();
}

class _AllListingsDetailScreenState extends State<AllListingsDetailScreen> {
  CollectionReference allListingsItem =
      FirebaseFirestore.instance.collection('All Listings Item');

  Future<void> updateDoc(String id) {
    return allListingsItem.doc(id).update({'isInCart': true}).catchError(
        (error) => print('failed to update doc on firebase: $error'));
  }

  Future<void> submitToCart() async {
      String feedback = '';
    if (args.isInCart == true) {
      feedback = 'hey, i think you already entered this item to the cart!';

      print(feedback);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Product args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () async {
              await updateDoc(args.id);
              Navigator.of(context).pushNamed(
                CartScreen.routeName,
                // arguments: Product(),
              );
            },
          ),
        ],
        title: Text(
          'Detail Screen${': ' + args.title}',
          style: TextStyle(fontSize: 22, fontFamily: 'Lato-Light'),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                feedback,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                height: 400,
                width: 420,
                child: Image.network(
                  args.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                args.title,
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
            Divider(),
            Text(
              '\$${args.price.toString()}',
              style: TextStyle(fontSize: 35),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                args.description,
                style: TextStyle(fontSize: 25),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
