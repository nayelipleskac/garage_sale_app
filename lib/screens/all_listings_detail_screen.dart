import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';


import '../screens/cart_screen.dart';
import '../models/product.dart';


class AllListingsDetailScreen extends StatefulWidget {
  static const routeName = '/all-listings-detail-screen';

  @override
  _AllListingsDetailScreenState createState() =>
      _AllListingsDetailScreenState();
}

class _AllListingsDetailScreenState extends State<AllListingsDetailScreen> {
  // bool isInCart;
  bool success = false;
  String feedback = '';

  CollectionReference allListingsItem =
      FirebaseFirestore.instance.collection('All Listings Item');
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> updateDoc(String id) {
    return allListingsItem.doc(id).update({'isInCart': true}).catchError(
        (error) => print('failed to update doc on firebase: $error'));
  }

  Future<void> submitToCart(isInCart) async {
    // if (isInCart == true)
    //already stated
    if (isInCart == true) {
      print(isInCart);
      print('success is false');
      setState(() {
        success = false;
        feedback = 'hey, i think you already entered this item to the cart!';
      });
    }
    if (isInCart == false) {
      print(isInCart);
      success = true;
      print('success is true');
      // updateDoc(id);
      // Navigator.of(context).pushNamed(
      //   CartScreen.routeName,
      // );
    }

    // updateDoc(id)
  }
  //   // check if its in the cart
  //   // if true : add to cart and push screen
  //   // if false : display the popup (look up how to do it)

//the original onpressed function
// to be excuted after submit ot cart ahs finished
  // () async {
  //             await updateDoc(args.id);
  //             Navigator.of(context).pushNamed(
  //               CartScreen.routeName,

  //             );
  //           },

  @override
  Widget build(BuildContext context) {
    final Product args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () async {
              if (success == false) {
                print(args.isInCart);
                print('SUCCESS = FALSE HERE IN THE ONPRESSED!');
                await submitToCart(args.isInCart);
              }
              if (success == true) {
                print(args.isInCart);
                print('SUCCESS = TRUE IN THE ONPRESSES!');
                await updateDoc(args.id);
                Navigator.of(context).pushNamed(CartScreen.routeName);
              }
              // await updateDoc(args.id);
              // Navigator.of(context).pushNamed(
              //   CartScreen.routeName,
              // );
            },

            //run normally - just the button going to the cart (success) - and then gradually with prints comment back in the functions,
            //with the firebase to see if it really is the firebase.

            //see if it works normally /, then do the updateDoc /, and then the submittocart gradually!

            // onPressed: () async {
            //   if (success = false) {
            //     print('success is false');
            //     await submitToCart(args.isInCart, args.id);
            //   }
          ),
        ],
        title: Text(
          'Detail Screen${': ' + args.title}',
          style: TextStyle(fontSize: 22, fontFamily: 'Lato-Light'),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  feedback,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                height: 400,
                width: 420,
                child: Image.network(
                  args.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                args.title,
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
            Divider(),
            Text(
              '\$${args.price.toString()}',
              style: TextStyle(fontSize: 35),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                args.description,
                style: TextStyle(fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                DateFormat.yMMMd().format(widget.date),
                style: TextStyle(fontSize: 25),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
