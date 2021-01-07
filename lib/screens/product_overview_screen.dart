import 'package:flutter/material.dart';

import '../widgets/product_item.dart';
import '../models/product.dart';

class ProductOverviewScreen extends StatelessWidget {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'California tee',
      description: 'High quality and vintage',
      price: 100.00,
      imageUrl:
          'https://curtsy-parse-files.s3-us-west-2.amazonaws.com/34f605708cd1d1638492d4d433caa906_photo.jpeg',
    ),
    Product(
      id: 'p2',
      title: 'Bucket Hat',
      description: 'Easy to pair with any outfit',
      price: 4.99,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT84ImUoaVN1vBBI-GcpryJ7W2t1Q-9WhcnWw&usqp=CAU',
    ),
    Product(
      id: 'p3',
      title: 'Set of 5 Necklaces',
      description: 'Good quality, simple and pretty.',
      price: 24.99,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjSP890mNdPmm5KyUpLocvCuqe9FSAG3nSSQ&usqp=CAU',
    ),
    Product(
      id: 'p4',
      title: 'Pink crop top',
      description: 'Trendy and affordable',
      price: 49.99,
      imageUrl:
          'https://media1.popsugar-assets.com/files/thumbor/ElMFl63Geo_oKFDu-IYukAf9LHc/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2018/07/18/631/n/1922564/36f213929fbe8c85_netimgzsJBXw/i/Shein-Crop-Cami-Top.jpg',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Items',
          style: TextStyle(
            fontSize: 28,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: items.length,
        itemBuilder: (ctx, i) {
          return ProductItem(
            items[i].id,
            items[i].title,
            items[i].description.toString(),
            items[i].price,
            items[i].imageUrl,
          );
        },
      ),
    );
  }
}
