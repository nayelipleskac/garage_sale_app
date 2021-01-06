import 'package:flutter/material.dart';

import '../widgets/product_item.dart';
import '../models/product_providers.dart';

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Items',
          style: TextStyle(
            fontSize: 28,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //   crossAxisCount: 2,
        //   childAspectRatio: 3 / 2,
        //   crossAxisSpacing: 10,
        //   mainAxisSpacing: 10,
        // ),

        itemCount: items.length,
        itemBuilder: (ctx, i) {
          return ProductItem(
            id, title, price, description,
          );
        },
      ),
    );
  }
}
