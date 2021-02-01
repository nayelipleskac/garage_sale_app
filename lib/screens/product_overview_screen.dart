import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/product_item.dart';
import '../widgets/drawer.dart';
import './add_product_screen.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class ProductOverviewScreen extends StatelessWidget {
  static const routeName = 'product-overview-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
            ),
            onPressed: () async {
              Navigator.of(context).pushNamed(AddProductScreen.routeName);
            },
          ),
        ],
        centerTitle: true,
        title: Text(
          'My Items',
          style: TextStyle(
            fontFamily: 'Lato-Light',
            fontSize: 25,
          ),
        ),
      ),
      drawer: MainDrawer(),
      body: StreamBuilder<QuerySnapshot>(
          stream: _firestore.collection('Products').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text(
                snapshot.error.toString(),
              );
            }
            
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('Loading...');
            }
            return ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: snapshot.data.docs.length,
              itemBuilder: (ctx, i) {
                DocumentSnapshot prodDoc = snapshot.data.docs[i];
                return ProductItem(
                  prodDoc.id,
                  prodDoc['title'],
                  prodDoc['description'].toString(),
                  prodDoc['price'].toDouble(),
                  //prodDoc['imageUrl'],
                );
              },
            );
          }),
    );
  }
}
