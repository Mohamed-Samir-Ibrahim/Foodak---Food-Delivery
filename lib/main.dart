import 'package:flutter/material.dart';
import 'package:foodak_food_delivery/pages/bottom_nav_bar_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodak - Food Delivery',
      theme: ThemeData(primaryColor: Colors.deepOrange),
      home: BottomNavBarPage(),
    );
  }
}
