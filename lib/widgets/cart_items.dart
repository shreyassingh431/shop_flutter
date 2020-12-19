import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  final String imageUrl;

  CartItem(@required this.id, @required this.productId, @required this.price,
      @required this.quantity, @required this.title, @required this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
            horizontal: 15, vertical: 4), // for having size of bg same to card
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {

        // showDialog returns future but we need in boolean form for confirmDismiss above
       return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Are you Sure'),
                  content: Text("Sure about remove?"),
              actions: <Widget>[
                FlatButton(child: Text('No'), onPressed: () {
                  Navigator.of(context).pop(false); // will return false as optional param 'false' is passed
                }, ),
                FlatButton(child: Text('Yes'), onPressed: () {
                  Navigator.of(context).pop(true);  // will return true as optional param 'true' is passed
                }, )
              ],
                ));
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: Container(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ), //Text('\$$price'),
            ),
            title: Text(title),
            subtitle: Text('Total: \$${(price * quantity)}'),
            trailing: Text('$quantity x '),
          ),
        ),
      ),
    );
  }
}
