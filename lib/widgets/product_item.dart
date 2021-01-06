import 'package:flutter/material.dart';

import '../models/product_providers.dart';
import '../models/product.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  ProductItem(
    this.id,
    this.title,
    this.description,
    this.price,
    this.imageUrl,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'OpenSansCondensed',
              ),
            ),
            Text('\$$price'),
            Text(description),
          ],
        ),
      ),
    );
  }
}
