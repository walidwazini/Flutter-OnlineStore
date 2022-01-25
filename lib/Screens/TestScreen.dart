import 'package:flutter/material.dart';

import '../Widgets/Badge.dart';

class TestScreen extends StatelessWidget {
  static const routeName = '/test';

  // const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
        centerTitle: true,

        // leading: PopupMenuButton(
        //   itemBuilder: (_) => [
        //     PopupMenuItem(
        //       child: Text('Only Favourites'),
        //       value: 1,
        //     ),
        //     PopupMenuItem(
        //       child: Text('Show All'),
        //       value: 0,
        //     ),
        //   ],
        // ),
        leading: Badge(
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.accessibility),
          ),
          value: '1',
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 100,
                width: 200,
                color: Colors.red,
              ),
            ],
          ),
          Badge(
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.accessibility),
            ),
            value: '1',
          ),
        ],
      ),
    );
  }
}
