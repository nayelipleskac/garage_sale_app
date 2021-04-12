import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:intl/intl.dart';

import './product_overview_screen.dart';

class AddProductScreenWithImage extends StatefulWidget {
  static const routeName = '/add-product-with-image';

  final XFile imgFile;
  AddProductScreenWithImage(this.imgFile);

  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  _AddProductScreenWithImageState createState() =>
      _AddProductScreenWithImageState();
}

class _AddProductScreenWithImageState extends State<AddProductScreenWithImage> {
  final titleController = TextEditingController();

  final priceController = TextEditingController();

  final descriptionController = TextEditingController();

  DateTime selectedDate;

  String feedback = '';

  bool success = false;

  Future<void> _submitData() async {
    final enteredTitle = titleController.text;
    final enteredPrice = double.parse(priceController.text);
    final enteredDescription = descriptionController.text;

    if (enteredTitle.isEmpty ||
        enteredPrice.toString().isEmpty ||
        enteredDescription.isEmpty ||
        selectedDate == null) {
      print('one or more fields are empty');

      setState(() {
        feedback = 'Enter a value for all fields!';
        success = false;
      });
    }

    if (enteredPrice <= 0) {
      print('negative value or 0 entered for price');

      setState(() {
        feedback = 'Enter a positive value for price!';
        success = false;
      });
    }
    print('success!!!');
    success = true;
  }

  Future<void> uploadFile(XFile imgFile) async {
    File file = File(
      imgFile.path,
    );
    firebase_storage.FirebaseStorage storage =
        firebase_storage.FirebaseStorage.instance;

    final enteredTitle = titleController.text;
    final enteredPrice = double.parse(priceController.text);
    final enteredDescription = descriptionController.text;

    String downloadUrl = '';
    String uniqueId = DateTime.now().toString();
    try {
      await storage.ref('/product_images/$uniqueId').putFile(file);

      downloadUrl = await firebase_storage.FirebaseStorage.instance
          .ref('/product_images/$uniqueId')
          .getDownloadURL();
      print('DOWNLOAD URL' + downloadUrl);
      // give to firestore
    } catch (e) {
      print('ERROR:' + e);
    }

    CollectionReference products =
        FirebaseFirestore.instance.collection('Products');
    await products.add(
      {
        'title': enteredTitle,
        'price': enteredPrice,
        'description': enteredDescription,
        'url': downloadUrl,
        'date': selectedDate,
      },
    );
  }

  void _presentDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

  Widget buildTextField(String labelText, TextEditingController controller) {
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
              Text('Displayed Image:'),
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
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Add a date',
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: RaisedButton(
                  onPressed: () => _presentDatePicker(context),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: Text('choose date'),
                ),
              ),
              Container(
                //height: MediaQuery.of(context).size.height * 0.4,
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Text(
                      'chosen date: ',
                      style: TextStyle(fontSize: 25),
                    ),
                    selectedDate == null
                        ? Text(
                            ' No Date Chosen!',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Text(
                            DateFormat.yMMMEd().format(selectedDate),
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FlatButton(
                  onPressed: () async {
                    if (success == false) {
                      print('SUCCESS IS FALSE');
                      await _submitData();
                    }
                    if (success == true) {
                      Navigator.of(context)
                          .pushNamed(ProductOverviewScreen.routeName);
                      await uploadFile(widget.imgFile);
                    }
                    // if (success == true) {
                    //   print('SUCCESS IS TRUE');
                    // }
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
