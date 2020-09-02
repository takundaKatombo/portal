import 'dart:io';
import 'package:flutter/material.dart';

class UploadImage extends StatefulWidget {
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UpLoad image '),
      ),
      body: Center(
          //child:
          ),
    );
    // TODO: implement build
    //throw UnimplementedError();
  }

  chooseFile() {}

  uploadFile() {}
}
