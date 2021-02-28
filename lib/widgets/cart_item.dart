import 'package:flutter/material.dart';

import '../models/product.dart';
import '../models/product.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  final bool isInCart;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.imageUrl,
    @required this.isInCart,
  });

  @override
  Widget build(BuildContext context) {
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
                    imageUrl,
                    fit: BoxFit.cover,
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
      ],
    );
  }
}
