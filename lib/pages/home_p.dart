import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/products.dart';

class HomeP extends StatelessWidget {
  const HomeP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Достучимся до нашего класа
    final productData = Provider.of<ProductDataProvider>(context);
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height -
              85, //  медиа запросы размер, высота - 85 пик
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              // закругления слева и справа
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35),
            ),
          ),
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: [
              Container(
                child: const ListTile(
                  title: Text(
                    'water cold',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'many 100 vidov',
                    style: TextStyle(fontSize: 16),
                  ),
                  trailing: Icon(Icons.panorama),
                ),
              ),
              Container(
                height: 300, padding: EdgeInsets.all(5.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productData
                      .items.length, // количество которое будем рисовать
                  itemBuilder: (context, int index) =>
                      ChangeNotifierProvider.value(
                    value: productData.items[index],
                        child: ItemCart(),
                  ),
                ), // Скролинг по горизионтал
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text('каталог коктелей'),
              ),
              Container(
                child: Text('прокручиваемый список'),
              ),
            ],
          ),
        ),
      ),
      //!- ботом бар
    );
  }
}
