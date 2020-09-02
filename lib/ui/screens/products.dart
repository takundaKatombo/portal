import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portal/model/product.dart';
import 'package:portal/services/firebase_services.dart';
import 'package:portal/ui/widgets/product_row_item.dart';
import 'package:provider/provider.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //List products = Provider.of<List<Product>>(context);
    //FirebaseServices firebaseServices = FirebaseServices();
    CollectionReference users = Firestore.instance.collection('products');
    return Scaffold(
      appBar: AppBar(
        //TODO: ADD BUTTON TO FILTER PRODUCTS
        title: Text('Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, '/add'),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: users.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return new ListView(
            children: snapshot.data.documents.map((DocumentSnapshot document) {
              return ProductRowItem(
                //index: index,
                product: new Product(
                    name: document.data["name"],
                    id: document.documentID,
                    isFeatured: document.data["isFeatured"],
                    price: document.data["price"].toInt(),
                    imageName: document.data["imageName"],
                    quantity: document.data["quantity"]),
                lastItem: false,
              );
            }).toList(),
          );
        },
      ),

      /*CustomScrollView(
        slivers: [
          SliverSafeArea(
            top: false,
            minimum: const EdgeInsets.only(top: 8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index < products.length) {
                    return ProductRowItem(
                      index: index,
                      product: products[index],
                      lastItem: index == products.length - 1,
                    );
                  }

                  return null;
                },
              ),
            ),
          )
        ],
      ),*/
    );
  }
}
