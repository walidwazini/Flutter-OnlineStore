import 'package:flutter/material.dart';

import './Screens/ProductsOverviewScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<int, Color> myCustom = {
      50: Color.fromRGBO(66, 181, 219, 1.0),
      100: Color.fromRGBO(45, 128, 157, 1.0),
      200: Color.fromRGBO(25, 121, 160, 1),
      300: Color.fromRGBO(15, 116, 148, 1.0),
    };
    MaterialColor customColor = MaterialColor(0xFF93cd48, myCustom);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        primarySwatch: customColor,
      ),
      home: ProductsOverviewScreen(),
    );
  }
}
