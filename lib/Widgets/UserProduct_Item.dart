import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/ProductsProvider.dart';
import '../Screens/EditProductScreen.dart';

class UserProductItem extends StatelessWidget {
  final String? id;
  final String title;
  final String imageUrl;

  UserProductItem({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditProductScreen.routeName, arguments: id);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,
              onPressed: () {
                // Provider.of<ProductProvider>(
                //   context,
                //   listen: false,
                // ).deleteProducts(id!);
                print(id);
              },
            ),
            // IconButton(
            //   icon: Icon(Icons.info),
            //   color: Theme.of(context).errorColor,
            //   onPressed: () => print(id),
            // ),
          ],
        ),
      ),
    );
  }
}
