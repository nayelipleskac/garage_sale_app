import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/drawer.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  // final String id;
  // final String title;
  // final double price;
  // final String imageUrl;
  // final bool isInCart;

  // CartScreen({
  //   @required this.id,
  //   @required this.title,
  //   @required this.price,
  //   @required this.imageUrl,
  //   @required this.isInCart,
  // });
  static const routeName = '/cart-screen';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference allListingsItem =
      FirebaseFirestore.instance.collection('All Listings Item');

  double totalAmount = 0;

  Future<double> getTotalAmount() async {
    var query = await allListingsItem
        .get()
        .then((QuerySnapshot querySnap) => querySnap);
    //the start of the total
    var total = 0.0;

    // query.docs[i]['price'] will get the doc and the
    //price within it

    //query.size = query.docs.length

//checking so not every doc's price gets added up

    for (int i = 0; i < query.size; i++) {
      if (query.docs[i]['isInCart'] == true) {
        total += query.docs[i]['price'];
      }
    }
    return total;
  }

  @override

  //setState is when the app rebuilds and it needs to be rebuilded in order to update the screen. same concept for a statefull widget
  //will manually update the screen with the setstate to the correct value - 148 - not 3000, which is the
  void initState() {
    print(
        'LASDLJKFCLKJLFKJDFLGJKFLKJVLFKJVNJDFL;SDKFJGLKSJNKJLKDFSJ SD GSLK GSDLKFJG SDFLK;G');
    getTotalAmount().then((totalA) {
      setState(() {
        print(
          totalA,
        );
        print('tesing');
        totalAmount = totalA;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Container(
        // color: Colors.red,
        height: 900,
        child: Column(
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
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.data.size == 0) {
                        print('SNAPSHOT.data.docs == null');
                      }
                      if (snapshot.hasError) {
                        return Text('Something went wrong...');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text('Loading...');
                      }
                      int totalItemCount = snapshot.data.docs.length;
                      return Text(
                        totalItemCount.toString() + ' items',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
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
              child: Container(
                // color: Colors.black,
                // height: 100,
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
                                '\$${totalAmount.toStringAsFixed(2)}',
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
                    // Text(getTotalAmount().toString()),
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
            ),
          ],
        ),
      ),
    );
  }
}
