import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portal/model/product.dart';

class FirebaseServices {
  //Firestore _fireStoreDataBase = Firestore.instance;
  List products1;
  //recieve the data

  StreamBuilder<QuerySnapshot> getProductList() {
    CollectionReference users = Firestore.instance.collection('users');

    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return new ListView(
          children: snapshot.data.documents.map((DocumentSnapshot document) {
            return new ListTile(
              title: new Text(document.data['full_name']),
              subtitle: new Text(document.data['company']),
            );
          }).toList(),
        );
      },
    );
  }
}
