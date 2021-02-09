import 'package:flutter/material.dart';
import 'package:new2u_project/widgets/drawer.dart';

import '../widgets/all_listings_item.dart';
import '../models/product.dart';

class AllListingsScreen extends StatelessWidget {
  static const routeName = '/all-listings';

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;

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
      drawer: MainDrawer(),
      body: Container(
        height: 800,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Container(
              child: AllListingsItem(
                id: args['data'][index].id,
                title: args['data'][index].title,
                price: args['data'][index].price,
                imageUrl: args['data'][index].imageUrl,
              ),
            );
          },
          itemCount: args['data'].length,
        ),
      ),
      //body: Text('${args.data}'),
    );
  }
}
