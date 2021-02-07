import 'package:flutter/material.dart';

import '../widgets/drawer.dart';
import '../screens/all_listings_detail_screen.dart';

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
                              Navigator.of(context)
                                  .pushNamed(AllListingsDetailScreen.routeName);
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
