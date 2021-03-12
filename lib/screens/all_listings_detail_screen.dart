import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../screens/cart_screen.dart';
import '../models/product.dart';

class AllListingsDetailScreen extends StatelessWidget {
  static const routeName = '/all-listings-detail-screen';

  CollectionReference allListingsItem =
      FirebaseFirestore.instance.collection('All Listings Item');

//writes to firestore and changes the value of isInCart from false to true
//allows the item to be put in the cart

  Future<void> updateDoc(String id) {
    return allListingsItem.doc(id).update({'isInCart': true}).catchError(
        (error) => print('failed to update doc on firebase: $error'));
  }

  String feedback = '';

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
              if (args.isInCart == true) {
                feedback = 'hey, i think you already entered this item to the cart!';
                // return Center(
                //   child: Text(
                //     // 'this item is already in the cart! go back to shopping',
                //   ),
                // );
                print('THIS item is already in the cart!!');
              }
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
