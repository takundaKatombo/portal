import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal/model/product.dart';

class ProductRowItem extends StatelessWidget {
  const ProductRowItem({
    //this.index,
    this.product,
    this.lastItem,
  });

  final Product product;
  //final int index;
  final bool lastItem;

  @override
  Widget build(BuildContext context) {
    final row = SafeArea(
      top: false,
      bottom: false,
      minimum: const EdgeInsets.only(
        left: 16,
        top: 4,
        bottom: 4,
        right: 8,
      ),
      child: Card(
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                product.imageName,
                width: 80,
                height: 80,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Material(
                      child: Text(
                        product.name,
                        //style: Styles.productRowItemName,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 8)),
                    Material(
                      child: Text(
                        '\R${product.price}',
                        //style: Styles.productRowItemPrice,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Text('Stock Avail:${product.quantity}'),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                //final model = Provider.of<AppStateModel>(context);
                //model.addProductToCart(product.id);
              },
              child: const Icon(
                CupertinoIcons.ellipsis,
                semanticLabel: 'Add',
              ),
            ),
          ],
        ),
      ),
    );

    if (lastItem) {
      return row;
    }

    return Column(
      children: <Widget>[
        row,
        Padding(
          padding: const EdgeInsets.only(
            left: 100,
            right: 16,
          ),
          child: Container(
            height: 1,
            //color: Styles.productRowDivider,
          ),
        ),
      ],
    );
  }
}
