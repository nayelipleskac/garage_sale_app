import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../screens/product_overview_screen.dart';

class AddProductScreenWithImage extends StatefulWidget {
  static const routeName = '/add-product-with-image';

  final XFile imgFile;
  AddProductScreenWithImage(this.imgFile);

  @override
  _AddProductScreenWithImageState createState() =>
      _AddProductScreenWithImageState();
}

class _AddProductScreenWithImageState extends State<AddProductScreenWithImage> {
  final titleController = TextEditingController();

  final priceController = TextEditingController();

  final descriptionController = TextEditingController();

  String feedback = '';

  bool success = false;

  Future<void> _submitData() async {
    if (titleController.text.isEmpty ||
        priceController.text.isEmpty ||
        descriptionController.text.isEmpty) {
      print('one or more fields are empty');

      setState(() {
        feedback = 'Enter a value for all fields!';
        success = false;
      });
    }

    final enteredTitle = titleController.text;
    final enteredPrice = double.parse(priceController.text);
    final enteredDescription = descriptionController.text;

    if (enteredPrice <= 0) {
      print('negative value or 0 entered for price');

      setState(() {
        feedback = 'Enter a positive value for price!';
        success = false;
      });
    }
    print('success');
    success = true;
    Navigator.of(context).pushNamed(ProductOverviewScreen.routeName);

    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;

    firebase_storage.Reference ref =
        firebase_storage.FirebaseStorage.instance.ref('/product images');

    Future<void> uploadFile(imgFile) async {
      File file = File(
        imgFile.path,
      );
      // file = imgFile.path
      try {
        await firebase_storage.FirebaseStorage.instance
            .ref('/product images')
            .putFile(file);
      } catch (e) {
        print('CANCELED' + e.toString());
      }
    }

    CollectionReference products =
        FirebaseFirestore.instance.collection('Products');
    await products.add(
      {
        'title': enteredTitle,
        'price': enteredPrice,
        'description': enteredDescription,
      },
    );
  }

  Widget buildTextField(
    String labelText,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          icon: Icon(
            Icons.add_sharp,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add a Product',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'Lato-Light',
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Add an Item to Your Garage',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              Divider(),
              Text('Add the image:'),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    height: 300,
                    width: 300,
                    child: Image.file(
                      File(
                        widget.imgFile.path,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(15.0),
              //   child: Container(
              //     alignment: Alignment.center,
              //     child: Text(
              //       widget.imgFile.path,
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Add a title for your item:'),
              ),
              buildTextField(
                'Add a title',
                titleController,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Add a price for your item:'),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: priceController,
                  decoration: InputDecoration(
                    labelText: 'Add a price',
                    icon: Icon(
                      Icons.add_sharp,
                    ),
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('Add a description:'),
              ),
              buildTextField(
                'Add a description',
                descriptionController,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FlatButton(
                  onPressed: () async {
                    if (success == false) {
                      await _submitData();
                    }
                    if (success == true) {
                      await uploadFile(widget.imgFile);
                      print('SUCCESS = TRUE');
                    }
                  },
                  child: Text(
                    'Add Product',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Lato-Light',
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  feedback,
                  style: TextStyle(
                    color: Theme.of(context).errorColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
