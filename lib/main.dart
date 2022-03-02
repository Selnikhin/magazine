import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magazine/models/products.dart';
import 'package:magazine/pages/home_p.dart';
import 'package:provider/provider.dart';

import 'models/cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductDataProvider>(
          create: (context) => ProductDataProvider(),
        ),
        ChangeNotifierProvider<CartDataProvider>(
          create: (context) => CartDataProvider(),
        ),

      ],
      child: MaterialApp(
        title: 'Bags Magazine',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          backgroundColor: Colors.white,
          textTheme: GoogleFonts.marmeladTextTheme(
            Theme.of(context).textTheme, // Применяем шрифт для всех текстов
          ),
        ),
        home: const HomeP(),
      ),
    );
  }
}
