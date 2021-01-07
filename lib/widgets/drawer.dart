import 'package:flutter/material.dart';
import 'package:new2u_project/screens/all_listings_screen.dart';
import 'package:new2u_project/screens/cart_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 32,
        color: Colors.amber,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 35),
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
            height: 70,
          ),
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text(
              'The Combo of Your Favorite Thrift Stores and Garage Sales',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          buildListTile('My Items', Icons.shopping_bag, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('My Cart', Icons.shopping_cart, () {
            Navigator.of(context).pushReplacementNamed(CartScreen.routeName);
          }),
          buildListTile('All Listing', Icons.home, () {
            Navigator.of(context).pushReplacementNamed(AllListings.routeName);
          }),
        ],
      ),
    );
  }
}
