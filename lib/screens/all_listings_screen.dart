import 'package:flutter/material.dart';

import '../widgets/drawer.dart';
import '../widgets/all_listings_item.dart';
import '../models/product.dart';

class AllListingsScreen extends StatelessWidget {
  static const routeName = '/all-listings';

  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'CA T-Shirt',
      description: 'High quality ',
      price: 100.00,
      imageUrl:
          'https://curtsy-parse-files.s3-us-west-2.amazonaws.com/34f605708cd1d1638492d4d433caa906_photo.jpeg',
    ),
    Product(
      id: 'p2',
      title: 'Pants',
      description: 'good quality',
      price: 22.99,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSySN9lHWMQJZZuFQF8SiQhPurCOX5RhkyzMTnDACCwpfsP-05GS5dfcLAr2PWhwZh2GVNNvnYt&usqp=CAc',
    ),
    Product(
      id: 'p3',
      title: 'Bucket Hat',
      description: 'Good quality for the summer',
      price: 24.99,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT84ImUoaVN1vBBI-GcpryJ7W2t1Q-9WhcnWw&usqp=CAU',
    ),
    Product(
      id: 'p4',
      title: 'Tank Top',
      description: 'very soft',
      price: 49.99,
      imageUrl:
          'https://media1.popsugar-assets.com/files/thumbor/ElMFl63Geo_oKFDu-IYukAf9LHc/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2018/07/18/631/n/1922564/36f213929fbe8c85_netimgzsJBXw/i/Shein-Crop-Cami-Top.jpg',
    ),
  ];
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
      ),
      drawer: MainDrawer(),
      //body: Text('${args['data']}'),

      body: Container(
        height: 800,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Container(
              child: AllListingsItem(
                id: _items[index].id,
                title: _items[index].title,
                price: _items[index].price,
                imageUrl: _items[index].imageUrl,
              ),
            );
          },
          itemCount: _items.length,
        ),
      ),
    );
  }
}
