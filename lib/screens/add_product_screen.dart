import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddProductScreen extends StatefulWidget {
  static const routeName = '/add-product';

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
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
    final enteredPrice = int.parse(priceController.text);
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
      },
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
              Text('Add the image url:'),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Add the image url',
                    icon: Icon(
                      Icons.add_sharp,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Add a title for your item:'),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Add a title',
                    icon: Icon(
                      Icons.add_sharp,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Add a price for your item:'),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(
                  labelText: 'Add a price',
                  icon: Icon(
                    Icons.add_sharp,
                  ),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('Add a description:'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Add a description',
                  icon: Icon(
                    Icons.add_sharp,
                  ),
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
