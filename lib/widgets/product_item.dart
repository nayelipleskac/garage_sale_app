import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  ProductItem(
    this.id,
    this.title,
    this.description,
    this.price,
    this.imageUrl,
  );

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 200,
                  width: 200,
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'OpenSansCondensed',
                ),
              ),
              Container(
                child: Text('\$${widget.price}'),
              ),
              IconButton(
                icon: Icon(
                  _expanded ? Icons.expand_less : Icons.expand_more,
                ),
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
              ),
              if (_expanded)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Text(widget.description),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
