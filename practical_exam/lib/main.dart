import 'package:flutter/material.dart';
import 'package:practical_exam/utills/routes.dart';
import 'package:practical_exam/views/screens/cart_page.dart';
import 'package:practical_exam/views/screens/home_page.dart';
import 'package:practical_exam/views/screens/product_details.dart';

void main() {
  runApp(
    const Myapp(),
  );
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        GlobalRoutes.home_page: (context) => const HomePage(),
        GlobalRoutes.detail_page: (context) => ProductDetailPage(),
        GlobalRoutes.cart_page: (context) => const CartPage(),
      },
    );
  }
}
