import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({@required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price });

}

class Cart with ChangeNotifier {

  Map<String, CartItem> _items;

  Map<String, CartItem> get items {
    return {...items};
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      //update quantity
      _items.update(productId, (existngCartItem) =>
          CartItem(id: existngCartItem.id,
              title: existngCartItem.title,
              quantity: existngCartItem.quantity + 1,
              price: existngCartItem.price));
    } else {
      _items.putIfAbsent(productId, () =>
          CartItem(id: DateTime.now().toString(),
              title: title,
              price: price,
              quantity: 1));
    }
  }

}