import 'dart:math';

import 'package:flutter/material.dart';

import '../Screens/OrdersScreen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Hello Walid'),
            automaticallyImplyLeading: false,  // To disable back/return button
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/orders');
            },
          ),
          IconButton(
            icon: Icon(Icons.ac_unit),
            onPressed: () {
              print(Random().nextInt(3000));
            },
          ),
        ],
      ),
    );
  }
}
