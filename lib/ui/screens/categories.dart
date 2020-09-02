//TODO: DROP DOWN LIST TILES WITH INFOR ON CATEGORIES AND BUTTONS TO EDIT

import 'package:flutter/material.dart';
//import 'package:portal/model/product.dart';

class Categories extends StatelessWidget {
  //final products = loadProducts(Category.all);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //TODO: ADD BUTTON TO FILTER PRODUCTS
        title: Text('Product Categories'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverSafeArea(
            top: false,
            minimum: const EdgeInsets.only(top: 8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index < 5) {
                    return ExpansionTile(
                        title: Text(
                          "Category name",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        children: <Widget>[
                          ListTile(
                            title: Text('Category Description'),
                          ),
                          Row(children: [
                            SizedBox(
                              width: 70,
                            ),
                            RaisedButton(
                              onPressed: null,
                              child: Text('Edit'),
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            RaisedButton(
                              onPressed: null,
                              child: Text('Delete'),
                            )
                          ]),
                        ]);
                  }

                  return null;
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
