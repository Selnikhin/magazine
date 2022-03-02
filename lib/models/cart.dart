import 'dart:collection';

import 'package:flutter/cupertino.dart';

class Cart {
  final String id;
  final String title;
  final int number;
  final num price;
  final String images;

  Cart(
      {required this.id,
      required this.title,
      required this.number,
      required this.price,
      required this.images});
}

// Cart Provider
class CartDataProvider with ChangeNotifier {
  Map<String, Cart> _cItems = {};

  UnmodifiableMapView<String, Cart> get cartItems =>
      UnmodifiableMapView(_cItems);

  int get cartItemsCount => _cItems.length;

  double get totalAmount {
    var total = 0.0;
    _cItems.forEach((key, item) {
      total += item.price * item.number;
    });

    return total;
  }

  get images => null;

  void addItem({productId, price, title, imgUrl}) {
    if (_cItems.containsKey(productId)) {
      _cItems.update(
          productId,
          (ex) => Cart(
                id: ex.id,
                title: ex.title,
                price: ex.price,
                images: ex.images,
                number: ex.number + 1,
              ));
    } else {
      _cItems.putIfAbsent(
          productId,
          () => Cart(
                id: '${DateTime.now()}',
                title: title,
                price: price,
                images: images,
                number: 1,
              ));
    }
    notifyListeners();
  }

  void deleteItem(String productId) { // удаление товара из корзины
    _cItems.remove(productId);
    notifyListeners(); // слушатель
  }

  //добавить товар в корзине на 1
  void updateItemsAddOne(String productId) {
    _cItems.update(
      productId,
      (ex) => Cart(
        id: ex.id,
        title: ex.title,
        price: ex.price,
        images: ex.images,
        number: ex.number + 1,
      ),
    );
    notifyListeners();
  }

  // удаление одного товара на 1 по id
  void updateItemsSubOne(String productId) {
    if (_cItems[productId]!.number < 2) {
      deleteItem(productId);
    } else {
      _cItems.update(
        productId,
        (ex) => Cart(
          id: ex.id,
          title: ex.title,
          price: ex.price,
          images: ex.images,
          number: ex.number - 1,
        ),
      );
    }
    notifyListeners();
  }

  void clear() { // очишение корзины
    _cItems = {};
    notifyListeners();
  }
}
