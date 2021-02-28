import 'package:flutter/material.dart';

import '../screens/all_listings_detail_screen.dart';
import '../screens/all_listings_screen.dart';
import '../models/product.dart';

class AllListingsItem extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  AllListingsItem({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          child: Card(
            elevation: 5,
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        height: 250,
                        // width: 10,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text('\$$price'),
                              IconButton(
                                icon: Icon(Icons.arrow_forward),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                    AllListingsDetailScreen.routeName,
                                    arguments: Product(
                                      id: id,
                                      title: title,
                                      description: description,
                                      price: price,
                                      imageUrl: imageUrl,
                                      isInCart: true,
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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
