import 'package:flutter/material.dart';

import '../models/product.dart';
import '../models/product.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final String imageUrl;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.imageUrl,
  });


  @override
  Widget build(BuildContext context) {
    final Product args = ModalRoute.of(context).settings.arguments;

    return Column(
      children: [
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
                            '\$${args.price}',
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
          height: 50,
        ),
        SizedBox(
          height: 10,
        ),
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
                    '\$${26}',
                    style: TextStyle(
                      color: Theme.of(context).primaryTextTheme.headline6.color,
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
        // ListView.builder(
        //   itemBuilder: (ctx, i) =>
        //       CartItem(id: null, title: null, price: null, imageUrl: null),
        // ),
      ],
    );
  }
}
