import 'package:flutter/material.dart';
import 'package:new2u_project/screens/all_listings_detail_screen.dart';
import 'package:new2u_project/widgets/drawer.dart';

class AllListingsScreen extends StatelessWidget {
  static const routeName = '/all-listings';
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
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              height: 300,
              child: Card(
                margin: EdgeInsets.all(20),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          'https://curtsy-parse-files.s3-us-west-2.amazonaws.com/34f605708cd1d1638492d4d433caa906_photo.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('CA Tshirt'),
                            Text('\$${39.99}'),
                            IconButton(
                              icon: Icon(Icons.arrow_forward),
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                    AllListingsDetailScreen.routeName);
                              },
                            )
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
      ),
    );
  }
}
