import 'package:flutter/material.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/screens/edit_product_screen.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:shop/widgets/user_product_item.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/user-products';
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(appBar: AppBar(
      title: Text('Your Products'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed(EditProductScreen.routeName);
          },
        ),
      ],
    ),
      drawer: AppDrawer(),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(itemCount: productsData.items.length,itemBuilder: (_, index)=> Column(
            children: [
              UserProductItem(
                productsData.items[index].id,
                productsData.items[index].title,
                productsData.items[index].imageUrl,
              ),
              Divider(),
            ],
          ) ),
        )
    );
  }

}