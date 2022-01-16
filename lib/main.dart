import 'package:flutter/material.dart';

import './Screens/ProductsOverviewScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: ProductsOverviewScreen(),
    );
  }
}
