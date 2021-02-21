import 'package:flutter/material.dart';

import '../widgets/drawer.dart';
import '../models/product.dart';

class CartScreen extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final String imageUrl;

  CartScreen({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.imageUrl,
  });
  static const routeName = '/cart-screen';
  @override
  Widget build(BuildContext context) {
    final Product args = ModalRoute.of(context).settings.arguments;

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
            height: 50,
          ),
          Container(
            height: 200,
            child: Card(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    // does the same thing as media query
                    // width: MediaQuery.of(context).size.width * 0.5,
                    child: Image.network(
                      args.imageUrl,
                      // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpxM8xEIxBWslbwwR257jXndlRYUXpzynwOSRt4gipamoxcJSFUo6bIUAmZaWa6D5RinwYsV1W&usqp=CAc',
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SafeArea(
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              args.title,
                              // 'baby succulent',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(
                              '\$${args.price.toString()}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
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
    );
  }
}
