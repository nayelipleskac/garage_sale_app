import 'package:flutter/material.dart';
import '../models/product.dart';
import 'package:new2u_project/screens/all_listings_screen.dart';
import 'package:new2u_project/screens/cart_screen.dart';
import 'package:new2u_project/screens/product_overview_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 27,
        color: Colors.amber,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 27),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.center,
            child: Text(
              'Thrifty Garage',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lato-Light',
              ),
            ),
          ),
          buildListTile('My Items', Icons.shopping_bag, () {
            Navigator.of(context)
                .pushReplacementNamed(ProductOverviewScreen.routeName);
          }),
          buildListTile('My Cart', Icons.shopping_cart, () {
            Navigator.of(context).pushReplacementNamed(CartScreen.routeName);
          }),
          buildListTile('All Listings', Icons.home, () {
            Navigator.pushNamed(
              context,
              AllListingsScreen.routeName,
            );
          }),
        ],
      ),
    );
  }
}
