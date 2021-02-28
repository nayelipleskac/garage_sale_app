import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/drawer.dart';
import '../models/product.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  final bool isInCart;

  CartScreen({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.imageUrl,
    @required this.isInCart,
  });
  static const routeName = '/cart-screen';
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference cart = FirebaseFirestore.instance
      .collection('All Listings Item')
      .where('isInCart').get().then((cart) => true);

  @override
  Widget build(BuildContext context) {
    // final Product args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'Lato-Light',
          ),
        ),
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: StreamBuilder<QuerySnapshot>(
          stream: _firestore.collection('All Listings Item').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong...');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('Loading...');
            }

            return ListView.builder(
              itemBuilder: (ctx, index) {
                DocumentSnapshot cartDoc = snapshot.data.docs[index];
                return Container(
                  child: CartItem(
                    id: cartDoc.id,
                    title: cartDoc['title'],
                    // description: allListingsDoc['description'],
                    price: cartDoc['price'].toDouble(),
                    imageUrl: cartDoc['imageUrl'],
                    isInCart: cartDoc[isInCart],
                  ),
                );
              },
              itemCount: snapshot.data.docs.length,
            );
          }),
    );
  }
}
