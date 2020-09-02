//import 'dart:ffi';

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();

  final _productNameController = TextEditingController();

  final _quantityController = TextEditingController();

  final _priceController = TextEditingController();

  final _categoryController = TextEditingController();

  File _image;

  String _uploadedImageURL;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit(context) async {
    /*setState(() {
      _errorMessage = "";
      _isLoading = true;
    });*/
    //String userId = "";
    try {
      if (validateAndSave() && (_uploadedImageURL != null)) {
        final firestoreInstance = Firestore.instance;
        firestoreInstance.collection("products").add({
          "name": _productNameController.text,
          "price": double.parse(_priceController.text),
          "category": int.parse(_categoryController.text),
          "quantity": int.parse(_quantityController.text),
          "isFeatured": false,
          "imageName": _uploadedImageURL,
        });
        _scaffoldKey.currentState
            .showSnackBar(new SnackBar(content: new Text('product added ')));
        _formKey.currentState.reset();
        sleep(const Duration(seconds: 5));
        Navigator.pop(context);
      } else
        throw ('review product information and try again');
    } catch (e) {
      // final snack = SnackBar(content: Text(e.toString()));
      // Scaffold.of(context).showSnackBar(snack);
      _scaffoldKey.currentState
          .showSnackBar(new SnackBar(content: new Text(e.toString())));

      //
      print(e); // _isLoading = false;
      // _errorMessage = e.message;
      _formKey.currentState.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    String _name;
    double _price;
    int _quantity;
    int _category;
    String _imageName;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          'Add Product',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            height: MediaQuery.of(context).size.height * 0.65,
            width: MediaQuery.of(context).size.width * 0.8,
            top: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.width * 0.1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                /*borderRadius: BorderRadius.only(
                                                                  topLeft: Radius.circular(10),
                                                                    topRight: Radius.circular(10),
                                                                    bottomLeft: Radius.circular(10),
                                                                    bottomRight: Radius.circular(10)
                                                                ),*/
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              //color: Colors.grey,
              child: Form(
                autovalidate: true,
                key: _formKey,
                child: ListView(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  shrinkWrap: true,

                  children: [
                    //Icon(const IconData(60230)),
                    TextFormField(
                      validator: (value) =>
                          value.isEmpty ? 'enter product name' : null,
                      onFieldSubmitted: (value) => _name = value.trim(),
                      controller: _productNameController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      cursorColor: Colors.red,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                      decoration: const InputDecoration(
                        hintText: 'Enter Product Name',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),

                    TextFormField(
                      validator: (value) =>
                          value.isEmpty ? 'enter product price' : null,
                      onFieldSubmitted: (value) =>
                          _price = value.trim() as double,
                      controller: _priceController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      cursorColor: Colors.red,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                      decoration: const InputDecoration(
                        hintText: 'Price',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (value) =>
                          value.isEmpty ? 'enter stock available' : null,
                      onFieldSubmitted: (value) =>
                          _quantity = value.trim() as int,
                      controller: _quantityController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      cursorColor: Colors.red,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                      decoration: const InputDecoration(
                        hintText: 'Quantity in Stock',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (value) =>
                          value.isEmpty ? 'enter product category' : null,
                      onFieldSubmitted: (value) =>
                          _category = value.trim() as int,
                      controller: _categoryController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      cursorColor: Colors.red,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                      decoration: const InputDecoration(
                        hintText: 'Category',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                    Column(children: <Widget>[
                      Container(
                        height: 10,
                      ),
                      _image != null
                          ? Image.file(_image, height: 80, width: 80)
                          : Container(
                              child: Placeholder(),
                              width: 80,
                              height: 80,
                            ),
                      //Text('Selected Image'),
                      _image == null
                          ? RaisedButton(
                              onPressed: chooseFile,
                              child: Text('Choose File'),
                              color: Colors.red,
                            )
                          : Container(),
                      _image != null
                          ? RaisedButton(
                              onPressed: uploadFile,
                              child: Text('Upload File'),
                              color: Colors.red,
                            )
                          : Container(),
                    ]),
                    /*TextFormField(
                                                      controller: _dayInController,
                                                      keyboardType: TextInputType.text,
                                                      textInputAction: TextInputAction.next,
                                                      cursorColor: Colors.red,
                                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                                                      decoration: const InputDecoration(
                                                        hintText: 'Color',
                                                        enabledBorder: UnderlineInputBorder(      
                                                          borderSide: BorderSide(color: Colors.red),   
                                                          ),  
                                                        focusedBorder: UnderlineInputBorder(
                                                          borderSide: BorderSide(color: Colors.red),
                                                       ),  
                                                      ),
                                                
                                                    ),*/

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: RaisedButton(
                        onPressed: () {
                          // Validate will return true if the form is valid, or false if
                          // the form is invalid.
                          //if (_formKey.currentState.validate()) {
                          // Process data.
                          //}
                          validateAndSubmit(context);
                        },
                        child: Text(
                          'Add Product',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  uploadFile() async {
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child('gs://booker-1f0b6.appspot.com');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    try {
      await uploadTask.onComplete;
      _scaffoldKey.currentState
          .showSnackBar(new SnackBar(content: new Text('upload complete')));
    } catch (e) {
      _scaffoldKey.currentState
          .showSnackBar(new SnackBar(content: new Text(e.toString())));

      print(e);
    }
    storageReference
        .getDownloadURL()
        .then((value) => _uploadedImageURL = value);
  }

  chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((value) {
      _image = value;
      setState(() {});
    });
  }
}
