import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products.dart';

import '../providers/product.dart';
import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool _showFavs;

  ProductsGrid(this._showFavs);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = _showFavs? productsData.FavouriteItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products!=null?products.length:0,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        //builder: (c) => products[i],
          value : products[i],
        child: ProductItem(
          // products[i].id,
          // products[i].title,
          // products[i].imageUrl,
        ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
