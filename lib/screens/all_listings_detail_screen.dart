import 'package:flutter/material.dart';

import '../models/product.dart';

class AllListingsDetailScreen extends StatelessWidget {
  static const routeName = '/all-listings-detail-screen';

  @override
  Widget build(BuildContext context) {
    final Product args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Screen${': ' + args.title}',
          style: TextStyle(fontSize: 25, fontFamily: 'Lato-Light'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(15),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                height: 400,
                width: 420,
                child: Image.network(
                  args.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                args.title,
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
            Text(
              '\$${args.price.toString()}',
              style: TextStyle(fontSize: 35),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                args.description,
                style: TextStyle(fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
