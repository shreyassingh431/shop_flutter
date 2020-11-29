import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products.dart';

class ProductDetailsScreen extends StatelessWidget{
  //final String title;
  //ProductDetailsScreen(this.title);

  static const routeName = '/Product-detail';

  @override
  Widget build(BuildContext context) {
    final ProductId = ModalRoute.of(context).settings.arguments as String ;
    final loadedProduct = Provider.of<Products>(context, listen: true).findById(ProductId); //listen avoids rebuild of widget
    return Scaffold(appBar:  AppBar(title:  Text(loadedProduct.title)));
  }

}