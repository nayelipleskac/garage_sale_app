import 'package:flutter/material.dart';

import '../screens/all_listings_detail_screen.dart';
import '../screens/all_listings_screen.dart';
import '../models/product.dart';

class AllListingsItem extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final String imageUrl;

  AllListingsItem({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            height: 300,
            child: Card(
              elevation: 5,
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(title),
                          Text('\$$price'),
                          IconButton(
                            icon: Icon(Icons.arrow_forward),
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                AllListingsDetailScreen.routeName,
                                arguments: Product(
                                  id: 'abc',
                                  title: 'hoodie',
                                  description:
                                      'good quality, adkjhgbvf hjvjbf kdjhbjv fkdgcan i ne er  i lain',
                                  price: 100.00,
                                  imageUrl:
                                      'https://curtsy-parse-files.s3-us-west-2.amazonaws.com/34f605708cd1d1638492d4d433caa906_photo.jpeg',
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
