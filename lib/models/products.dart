import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final num price;
  final String image;
  final int size;
  final color;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.image,
      required this.size,
      required this.color});
}

class ProductDataProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: '1',
      title: "Reg Bag",
      price: 120,
      size: 26 - 16,
      description:
          'Красивая красная сумка,хорошо сочетается с белыми тонами, вместительная и удобная.',
      image: "assets/img/backpack.jpg",
      color: Color(0xF3720404),
    ),
    Product(
      id: '2',
      title: "Blue Bag",
      price: 140,
      size: 26 - 16,
      description:
          'Красивая красная сумка,хорошо сочетается с белыми тонами, вместительная и удобная.',
      image: "assets/img/backpack.jpg",
      color: Color(0xA3086AA3),
    ),
    Product(
      id: '3',
      title: "Beige Bag",
      price: 125,
      size: 26 - 16,
      description:
          'Красивая красная сумка,хорошо сочетается с белыми тонами, вместительная и удобная.',
      image: "assets/img/backpack.jpg",
      color: Color(0xa8eabf72),
    ),
    Product(
      id: '4',
      title: "Small Clutch",
      price: 100,
      size: 23 - 14,
      description:
          'Красивая красная сумка,хорошо сочетается с белыми тонами, вместительная и удобная.',
      image: "assets/img/backpack.jpg",
      color: Color(0xFD8BA1E2),
    ),
    Product(
      id: '5',
      title: "Round Bag",
      price: 200,
      size: 25 - 25,
      description:
          'Красивая красная сумка,хорошо сочетается с белыми тонами, вместительная и удобная.',
      image: "assets/img/backpack.jpg",
      color: Color(0xCEDEC698),
    ),
    Product(
      id: '6',
      title: "Backpack",
      price: 250,
      size: 26 - 25,
      description:
          'Красивая красная сумка,хорошо сочетается с белыми тонами, вместительная и удобная.',
      image: "assets/img/backpack.jpg",
      color: Color(0xFFAEAEAE),
    ),
  ];

  UnmodifiableListView<Product> get items => UnmodifiableListView(_items);

  Product getElementById(String id) =>
      _items.singleWhere((value) => value.id == id); // id = id

}
