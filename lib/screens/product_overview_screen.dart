import 'package:flutter/material.dart';

import '../widgets/product_item.dart';
import '../models/product.dart';

class ProductOverviewScreen extends StatelessWidget {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Vacuum',
      description: 'High quality and def does not smell at all :)',
      price: 100.00,
      imageUrl:
          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.ph%2Fpin%2F847450854860753138%2F%3Famp_client_id%3DCLIENT_ID(_)%26mweb_unauth_id%3D%7B%7Bdefault.session%7D%7D%26from_amp_pin_page%3Dtrue&psig=AOvVaw2s9lptWblju-jfTDo4JAZB&ust=1609806176938000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKCohL6Bge4CFQAAAAAdAAAAABAf',
    ),
    Product(
      id: 'p2',
      title: 'Piggy Bank',
      description: 'Holds all your loose change.',
      price: 2.99,
      imageUrl:
          'https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn.shopify.com%2Fs%2Ffiles%2F1%2F0359%2F4025%2Fproducts%2F40104_piggy_bank.jpg%3Fv%3D1539181759&imgrefurl=https%3A%2F%2Fwww.pearhead.com%2Fproducts%2Fblue-polka-dot-piggy-bank&tbnid=tMtz4Z4ruO7g7M&vet=12ahUKEwiK5cO_goHuAhVI1p4KHRoNC24QMygSegUIARDkAg..i&docid=h7ntcJEzTd63JM&w=1024&h=1024&q=piggy%20bank&ved=2ahUKEwiK5cO_goHuAhVI1p4KHRoNC24QMygSegUIARDkAg',
    ),
    Product(
      id: 'p3',
      title: 'Tennis Racket',
      description: 'Good quality and quite springy.',
      price: 24.99,
      imageUrl:
          'https://www.google.com/imgres?imgurl=https%3A%2F%2Fi5.walmartimages.com%2Fasr%2F0e13ecac-56b8-4d1a-ac06-d688b1b289d0_1.6d78ca1b31bf72db4dbe3386ca830c9a.jpeg&imgrefurl=https%3A%2F%2Fwww.walmart.com%2Fip%2FWilson-Ultra-Power-XL-112-Tennis-Racket%2F540322263&tbnid=HyfGaMS19kPquM&vet=12ahUKEwj59PDPgoHuAhVHlp4KHasZA3cQMygBegUIARDsAg..i&docid=Qy7QuJgwNcY_YM&w=2000&h=2000&q=tennis%20racket&ved=2ahUKEwj59PDPgoHuAhVHlp4KHasZA3cQMygBegUIARDsAg',
    ),
    Product(
      id: 'p4',
      title: 'Bookcase',
      description: 'Holds all your book series!',
      price: 49.99,
      imageUrl:
          'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.amazon.com%2FLeyiyi-Bookshelf-Background-Education-Hardcover%2Fdp%2FB07DPK5ZFX&psig=AOvVaw22V4VI0iNahlNPXB7BnVnP&ust=1609806512649000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCNCPm96Cge4CFQAAAAAdAAAAABAL',
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
