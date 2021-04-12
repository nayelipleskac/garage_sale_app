import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../screens/take_picture_screen.dart';

class AddProductScreen extends StatefulWidget {
  static const routeName = '/add-product';

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final titleController = TextEditingController();

  final priceController = TextEditingController();

  final descriptionController = TextEditingController();

  DateTime selectedDate;

  String feedback = '';

  bool success = false;

  Future<void> _submitData() async {
    if (titleController.text.isEmpty ||
        priceController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        selectedDate == null) {
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
    Navigator.of(context).pushNamed('/');

    CollectionReference products =
        FirebaseFirestore.instance.collection('Products');
    await products.add(
      {
        'title': enteredTitle,
        'price': enteredPrice,
        'description': enteredDescription,
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
              IconButton(
                icon: Icon(Icons.camera_alt),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(TakePictureScreen.routeName);
                },
                iconSize: 30,
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
                  'Add a date:',
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FlatButton(
                  onPressed: () async {
                    if (success == false) {
                      await _submitData();
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
