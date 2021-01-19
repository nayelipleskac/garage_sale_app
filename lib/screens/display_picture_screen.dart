import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import './take_picture_screen.dart';

class DisplayPictureScreen extends StatelessWidget {
  static const routeName = '/display-picture';
  final XFile imgFile;

  DisplayPictureScreen(this.imgFile);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Displayed Picture',
          style: TextStyle(fontSize: 25, fontFamily: 'Lato-Light'),
        ),
        centerTitle: true,
      ),
      // body: Text(
      //   imgFile,

      body: Container(
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 500,
            width: 500,
            child: Image.file(
              File(
                imgFile.path,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
