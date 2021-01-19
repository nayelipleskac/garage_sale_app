import 'dart:io';

import 'package:flutter/material.dart';

import './take_picture_screen.dart';

class DisplayPictureScreen extends StatelessWidget {
  static const routeName = '/display-picture';
  final String imgPath;

  DisplayPictureScreen(this.imgPath);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Displayed Picture'),
      ),
      body: Image.file(
        File(imgPath),
      ),
    );
  }
}
