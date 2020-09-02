import 'package:flutter/material.dart';
//import 'package:portal/model/product.dart';

class Orders extends StatelessWidget {
  //final products = loadProducts(Category.all);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //TODO: ADD BUTTON TO FILTER PRODUCTS
        title: Text('Orders'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              //TODO: SHOW FULLSCREEN DIALOG WITH ITEMS TO BE DELIVERED FOR SPECIFIC CUSTOMER WHICH WILL BE TICKED WHEN PACKING USERS ORDER .. NB ADDRESS TO USED IS FROM THE ENTERED DELIVERY ADDRESS
            },
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
                  if (index < 200) {
                    return ExpansionTile(
                        title: Text(
                          "Order number - Zone number",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        children: <Widget>[
                          ListTile(
                            title: Text('Order Description'),
                          ),
                          Row(children: [
                            SizedBox(
                              width: 70,
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            RaisedButton(
                              onPressed: null,
                              child: Text('Fulfill'),
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
