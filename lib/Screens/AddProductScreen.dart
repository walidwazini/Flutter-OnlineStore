import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  static const routeName = '/add-product';

  const AddProductScreen({Key? key}) : super(key: key);

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _priceController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _priceFocusNode = FocusNode();
  final _descFocusNode = FocusNode();
  final _imageFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Products'),
      ),
      body: Padding(
        padding: EdgeInsets.all(13),
        child: Form(
          child: ListView(
            children: [
              _buildTitleInput(),
              _buildPriceInput(),
              _buildDescInput(),
              SizedBox(height: 12),
              _buildInputImage(),
              SizedBox(height: 14),
              Container(
                child: ElevatedButton(
                  child: Text('Add Product'),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleInput() => TextFormField(
        decoration: InputDecoration(labelText: 'Title'),
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_priceFocusNode);
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please provide a value';
          }
          return null;
        },
      );

  Widget _buildPriceInput() => TextFormField(
        // initialValue: _initValues['price'],
        controller: _priceController,
        decoration: InputDecoration(labelText: 'Price'),
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        focusNode: _priceFocusNode,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_descFocusNode);
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please provide a value';
          }
          if (double.tryParse(value) == null) {
            return 'Enter a valid number';
          }
          if (double.parse(value) <= 5) {
            return 'Minimum price is RM 5';
          }
          return null;
        },
        // onSaved: (value) {
        //   _editedProduct = ProductModel(
        //       id: _editedProduct.id,
        //       isFavourite: _editedProduct.isFavourite,
        //       title: _editedProduct.title,
        //       price: double.parse(value!),
        //       description: _editedProduct.description,
        //       imageUrl: _editedProduct.imageUrl);
        // },
      );

  Widget _buildDescInput() => TextFormField(
        // initialValue: _initValues['description'],
        controller: _descController,
        decoration: InputDecoration(labelText: 'Description'),
        maxLines: 3,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.multiline,
        focusNode: _descFocusNode,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter a description';
          }
          return null;
        },
        // onSaved: (value) {
        //   _editedProduct = ProductModel(
        //       id: _editedProduct.id,
        //       isFavourite: _editedProduct.isFavourite,
        //       title: _editedProduct.title,
        //       price: _editedProduct.price,
        //       description: value!,
        //       imageUrl: _editedProduct.imageUrl);
        // },
      );

  Widget _buildInputImage() =>  Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.only(top: 8, right: 10),
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            )),
        child: _imageUrlController.text.isEmpty
            ? Text('Enter a URL')
            : FittedBox(
          child: Image.network(
            _imageUrlController.text,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Expanded(
        child: TextFormField(
          controller: _imageUrlController,
          decoration: InputDecoration(labelText: 'Image URL'),
          keyboardType: TextInputType.url,
          textInputAction: TextInputAction.done,
          focusNode: _imageFocusNode,
          // onFieldSubmitted: (_) => _saveForm(),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter an image URL.';
            }
            if (!value.startsWith('http') &&
                !value.startsWith('https')) {
              return ' Enter a valid URL';
            }
            if (!value.endsWith('.png') &&
                !value.endsWith('.jpg') &&
                !value.endsWith('.jpeg')) {
              return 'Enter a valid file';
            }
            return null;
          },
          // onSaved: (value) {
          //   _editedProduct = ProductModel(
          //     id: _editedProduct.id,
          //     isFavourite: _editedProduct.isFavourite,
          //     title: _editedProduct.title,
          //     price: _editedProduct.price,
          //     description: _editedProduct.description,
          //     imageUrl: value!,
          //   );
          // },
        ),
      )
    ],
  );
}
