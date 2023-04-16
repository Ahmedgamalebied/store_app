import 'package:flutter/material.dart';
import 'package:store_app/Screen/home.dart';

import 'Screen/update_product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        UpdateProductScreen.id: (context) => UpdateProductScreen(),
      },
      initialRoute: HomeScreen.id,
      home: const HomeScreen(),
    );
  }
}
