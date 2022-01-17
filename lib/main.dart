import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import './Providers/ProductsProvider.dart';
import './Screens/ProductsOverviewScreen.dart';
import './Screens/ProductDetailScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ChangeNotifierProvider(
      create: (ctx) => ProductProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My App',
        theme: ThemeData(
          primaryColor: Color(0xffb81384),
          backgroundColor: Colors.black12,
          highlightColor: Color.fromRGBO(193, 66, 165, 1.0),
          appBarTheme: AppBarTheme(
            color: Color(0xff1e18ae),
          ),
          textTheme: GoogleFonts.robotoTextTheme(textTheme).copyWith(
            bodyText1: GoogleFonts.oswald(textStyle: textTheme.bodyText1),
          ),
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}
