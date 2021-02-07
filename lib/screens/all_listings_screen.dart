import 'package:flutter/material.dart';

import '../widgets/all_listings_item.dart';
import '../models/product.dart';

class AllListingsScreen extends StatelessWidget {
  static const routeName = '/all-listings';
  final List<Product> listedProducts;
  AllListingsScreen(this.listedProducts);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Listings',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'Lato-Light',
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return AllListingsItem(
            title: listedProducts[index].title,
            price: listedProducts[index].price,
            imageUrl: listedProducts[index].imageUrl,
          );
        },
        itemCount: listedProducts.length,
      ),
    );
  }
}
