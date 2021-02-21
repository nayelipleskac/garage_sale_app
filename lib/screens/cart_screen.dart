import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
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
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Amount: ',
                    style: TextStyle(fontSize: 30),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '35.99',
                      style: TextStyle(
                        color:
                            Theme.of(context).primaryTextTheme.headline6.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            color: Colors.green,
            height: 200,
            child: Card(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    // width: MediaQuery.of(context).size.width * 0.5,
                    // alignment: Alignment.centerLeft,
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpxM8xEIxBWslbwwR257jXndlRYUXpzynwOSRt4gipamoxcJSFUo6bIUAmZaWa6D5RinwYsV1W&usqp=CAc',
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    // width: MediaQuery.of(context).size.width * 0.5,
                    // color: Colors.blue,
                    child: SafeArea(
                      child: Container(
                        // padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Expanded(
                            // flex: 1,
                            Text(
                              'planffffffffffffffffffffffffffrsetsdtestsdffffft 1',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            // ),
                            // Expanded(
                            // flex: 1,
                            Text(
                              '25',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            height: 200,
            child: Card(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    // width: MediaQuery.of(context).size.width * 0.5,
                    // alignment: Alignment.centerLeft,
                    child: Container(
                      child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp4ozPGKdqIv3ilO9f8QYB5kFzOAWA3-LK5A&usqp=CAU',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    // width: MediaQuery.of(context).size.width * 0.5,
                    // color: Colors.blue,
                    child: SafeArea(
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'planffffffffffffffffffffffffffrsetsdtestsdffffft 1',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text(
                              '25',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp4ozPGKdqIv3ilO9f8QYB5kFzOAWA3-LK5A&usqp=CAU
          //ListView.builder(),
        ],
      ),
    );
  }
}
