import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_force/Screens/TestScreen.dart';

import './Providers/ProductsProvider.dart';
import './Providers/CartProvider.dart';
import './Screens/ProductsOverviewScreen.dart';
import './Screens/ProductDetailScreen.dart';
import './Screens/CartScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (productCtx) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (cartCtx) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My App',
        theme: ThemeData(
          primaryColor: Color(0xffb81384),
          backgroundColor: Colors.black12,
          highlightColor: Color.fromRGBO(193, 66, 165, 1.0),
          appBarTheme: AppBarTheme(
            color: Color(0xff210ca5),
            // color: Theme.of(context).primaryColor,
          ),
          textTheme: GoogleFonts.robotoTextTheme(textTheme).copyWith(
            bodyText1: GoogleFonts.oswald(textStyle: textTheme.bodyText1),
          ),
        ),
        // home: TestScreen(),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          TestScreen.routeName : (ctx) => TestScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}
