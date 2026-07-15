import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodak_food_delivery/pages/bottom_nav_bar_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodak - Food Delivery',
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0.0,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
        ),
        dividerTheme: DividerThemeData(
          thickness: MediaQuery.of(context).size.width * 0.002,
          indent: MediaQuery.of(context).size.width * 0.010,
          endIndent: MediaQuery.of(context).size.width * 0.010,
        ),
        listTileTheme: ListTileThemeData(iconColor: Colors.deepOrange),
          fontFamily: 'OpenSans'
      ),
      home: BottomNavBarPage(),
    );
  }
}
