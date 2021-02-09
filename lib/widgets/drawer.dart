import 'package:flutter/material.dart';
import '../models/product.dart';
import 'package:new2u_project/screens/all_listings_screen.dart';
import 'package:new2u_project/screens/cart_screen.dart';
import 'package:new2u_project/screens/product_overview_screen.dart';

class MainDrawer extends StatelessWidget {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'CA T-Shirt',
      description: 'High quality and def does not smell at all :)',
      price: 100.00,
      imageUrl:
          'https://curtsy-parse-files.s3-us-west-2.amazonaws.com/34f605708cd1d1638492d4d433caa906_photo.jpeg',
    ),
    Product(
      id: 'p2',
      title: 'Pants',
      description: 'Holds all your loose change.',
      price: 22.99,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSySN9lHWMQJZZuFQF8SiQhPurCOX5RhkyzMTnDACCwpfsP-05GS5dfcLAr2PWhwZh2GVNNvnYt&usqp=CAc',
    ),
    Product(
      id: 'p3',
      title: 'Bucket Hat',
      description: 'Good quality and quite springy.',
      price: 24.99,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT84ImUoaVN1vBBI-GcpryJ7W2t1Q-9WhcnWw&usqp=CAU',
    ),
    Product(
      id: 'p4',
      title: 'Tank Top',
      description: 'Holds all your book series!',
      price: 49.99,
      imageUrl:
          'https://media1.popsugar-assets.com/files/thumbor/ElMFl63Geo_oKFDu-IYukAf9LHc/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2018/07/18/631/n/1922564/36f213929fbe8c85_netimgzsJBXw/i/Shein-Crop-Cami-Top.jpg',
    ),
  ];

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
                  fontSize: 30, fontWeight: FontWeight.bold, fontFamily: ''),
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
            Navigator.pushNamed(context, AllListingsScreen.routeName,
                arguments: {
                  'data': _items,
                });
          }),
        ],
      ),
    );
  }
}
