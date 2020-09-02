import 'package:flutter/material.dart';
//import 'package:portal/model/product.dart';

class Users extends StatelessWidget {
  //final products = loadProducts(Category.all);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //TODO: ADD BUTTON TO FILTER PRODUCTS
        title: Text('Registered Users'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverSafeArea(
            top: false,
            minimum: const EdgeInsets.only(top: 8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index < 300) {
                    return ListTile(
                      leading: Text('user name/email'),
                      title: Text('Discount Eligible'),
                    ); //TODO: DISCOUNT POINT AWARDING LOGIC ... SMART SHOPPER CARD ETC
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
