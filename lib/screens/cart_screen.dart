import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/drawer.dart';
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

  // CollectionReference allListingsItem =
  //     FirebaseFirestore.instance.collection('All Listings Item');

  // Future<void> updateDoc() {
  //   return allListingsItem
  //       .doc('2Y9JG6ZrdZyPC4GMzQej')
  //       .update({'isInCart': true})
  //       .then((value) => print('cart and firebase updated'))
  //       .catchError(
  //           (error) => print('failed to update doc on firebase: $error'));
  // }

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
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('All Listings Item')
                      .where('isInCart', isEqualTo: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    int totalItemCount = snapshot.data.docs.length;
                    return Text(
                      totalItemCount.toString() + ' items',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    );
                  }),
            ),
          ),
          StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('All Listings Item')
                  .where('isInCart', isEqualTo: true)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong...');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('Loading...');
                }

                return Expanded(
                  flex: 3,
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      DocumentSnapshot cartDoc = snapshot.data.docs[index];
                      return Container(
                        child: CartItem(
                          id: cartDoc.id,
                          title: cartDoc['title'],
                          // description: allListingsDoc['description'],
                          price: cartDoc['price'].toDouble(),
                          imageUrl: cartDoc['imageUrl'],
                          isInCart: cartDoc['isInCart'],
                        ),
                      );
                    },
                    itemCount: snapshot.data.docs.length,
                  ),
                );
              }),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Card(
                  margin: EdgeInsets.all(15),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total:',
                          style: TextStyle(fontSize: 25),
                        ),
                        Spacer(),
                        Chip(
                          label: Text(
                            '\$${56}',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .primaryTextTheme
                                  .headline6
                                  .color,
                            ),
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 350,
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () {},
                    child: Text(
                      'Checkout',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
