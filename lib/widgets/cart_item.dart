import 'package:flutter/material.dart';

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
    return Column(
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
                    imageUrl,
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
                            title,
                            // 'baby succulent',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Text(
                            '\$$price',
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
    );
  }
}
