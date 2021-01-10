import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  static const routeName = '/add-product';

  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();

  Future<void> _submitData() {
    final enteredTitle = titleController.text;
    final enteredPrice = int.parse(priceController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add a Product',
        ),
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
              Text('Add a title for your item:'),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
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
                decoration: InputDecoration(
                  labelText: 'Add a price',
                  icon: Icon(
                    Icons.add_sharp,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('Add a description:'),
              ),
              TextField(
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
                  onPressed: () {},
                  child: Text(
                    'Add Product',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Lato',
                    ),
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
