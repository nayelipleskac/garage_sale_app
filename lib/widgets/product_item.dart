import 'package:flutter/material.dart';

import '../models/product_providers.dart';
import '../models/product.dart';

class ProductItem extends StatelessWidget {
  var _expanded = false;

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
      //margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 200,
                  width: 200,
                  child: Image.network(
                    //imageUrl
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
              Container(
                child: Text('\$$price'),
              ),
              IconButton(
                  icon: Icon(
                    Icons.expand_less,
                  ),
                  onPressed: () {})
              //Text(description),
            ],
          ),
        ),
      ),
    );
  }
}
