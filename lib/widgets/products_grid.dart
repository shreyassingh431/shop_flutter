import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop/providers/products_dart.dart';
import 'package:shop/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  /*const ProductsGrid({
    Key key,
    @required this.loadedProducts,
  }) : super(key: key);

  final List<Product> loadedProducts;*/

  @override
  Widget build(BuildContext context) {
   final productsData =  Provider.of<Products>(context);
   final products = productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, index) => ProductItem(products[index].id, products[index].title,products[index].imageUrl),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2 ,// which is 1.5 because height should be more than width
          crossAxisSpacing: 10, // space between columns
          mainAxisSpacing: 10 // space between rows

      ),
    );
  }
}