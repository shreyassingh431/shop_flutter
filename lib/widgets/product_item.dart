import 'package:flutter/material.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/product.dart';
import 'package:shop/screens/product_details_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  /*final String id;
  final String title;
  final String imageUrl;

  ProductItem(this.id, this.title, this.imageUrl);*/

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context,
        listen: false); // here listen is false so that only widget inside consumer must adapt change.
    final cart = Provider.of<Cart>(context, listen: false);
    print("if listen is true, i will be print");
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
                ProductDetailsScreen.routeName, arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>( //Consumer takes builder defined below
            builder: (ctx, product, _) =>
                IconButton(
                    icon: Icon(product.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border),

                    color: Theme
                        .of(context)
                        .accentColor,
                    onPressed: () {
                      product.toggleFavoriteStatus();
                    }),
            //child: Text('Never Changes'),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Theme
                  .of(context)
                  .accentColor,
              onPressed: () {
                cart.addItem(
                    product.id, product.price, product.title, product.imageUrl);
                // here using Scaffold means it will connect to another nearest scaffold for showing snackbar
                Scaffold.of(context).hideCurrentSnackBar(); //hide old snackbar
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('Item added to cart'),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(label: "Undo", onPressed: ()  {
                      cart.removeSingleItem(product.id);
                    },),
                  ),);
              }),
        ),
      ),
    );
  }
}
