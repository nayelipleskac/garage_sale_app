import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/drawer.dart';
import '../widgets/all_listings_item.dart';
import '../models/product.dart';

class AllListingsScreen extends StatelessWidget {
  static const routeName = '/all-listings';

  // List<Product> _items = [
  //   Product(
  //     id: 'p1',
  //     title: 'CA T-Shirt',
  //     description: 'High quality ',
  //     price: 100.00,
  //     imageUrl:
  //         'https://curtsy-parse-files.s3-us-west-2.amazonaws.com/34f605708cd1d1638492d4d433caa906_photo.jpeg',
  //   ),
  //   Product(
  //     id: 'p2',
  //     title: 'Pants',
  //     description: 'good quality',
  //     price: 22.99,
  //     imageUrl:
  //         'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSySN9lHWMQJZZuFQF8SiQhPurCOX5RhkyzMTnDACCwpfsP-05GS5dfcLAr2PWhwZh2GVNNvnYt&usqp=CAc',
  //   ),
  //   Product(
  //     id: 'p3',
  //     title: 'Bucket Hat',
  //     description: 'Good quality for the summer',
  //     price: 24.99,
  //     imageUrl:
  //         'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT84ImUoaVN1vBBI-GcpryJ7W2t1Q-9WhcnWw&usqp=CAU',
  //   ),
  //   Product(
  //     id: 'p4',
  //     title: 'Tank Top',
  //     description: 'very soft',
  //     price: 49.99,
  //     imageUrl:
  //         'https://media1.popsugar-assets.com/files/thumbor/ElMFl63Geo_oKFDu-IYukAf9LHc/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2018/07/18/631/n/1922564/36f213929fbe8c85_netimgzsJBXw/i/Shein-Crop-Cami-Top.jpg',
  //   ),
  // ];

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference allListingsItem =
      FirebaseFirestore.instance.collection('All Listings Item');

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
      body: StreamBuilder<QuerySnapshot>(
          stream: _firestore.collection('All Listings Item').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong...');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('Loading...');
            }

            return ListView.builder(
              itemBuilder: (ctx, index) {
                DocumentSnapshot allListingsDoc = snapshot.data.docs[index];
                return Container(
                  child: AllListingsItem(
                    id: allListingsDoc.id,
                    title: allListingsDoc['title'],
                    description: allListingsDoc['description'],
                    price: allListingsDoc['price'].toDouble(),
                    imageUrl: allListingsDoc['imageUrl'],
                    isInCart: allListingsDoc['isInCart'],
                    date: DateTime.parse(allListingsDoc['date'].toDate().toString()),

                  ),
                );
              },
              itemCount: snapshot.data.docs.length,
            );
          }),
    );
  }
}
