import 'dart:io';

import 'package:flutter/material.dart';

class DisplayPictureScreen extends StatelessWidget {
  static const routeName = '/display-picture';
  final String imagePath;

  DisplayPictureScreen(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Displayed Picture'),
      ),
      body: Image.file(
        File(imagePath),
      ),
    );
  }
}
