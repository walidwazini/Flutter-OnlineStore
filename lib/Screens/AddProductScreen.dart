import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/ProductsProvider.dart';
import '../Models/ProductModel.dart';

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
  var _newProduct = ProductModel(
    id: null,
    title: '',
    description: '',
    price: 0,
    imageUrl:
        'https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png',
  );

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   _imageFocusNode.addListener(_updateImageUrl)
  //   super.initState();
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    // _imageFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descFocusNode.dispose();
    _imageUrlController.dispose();
    _imageFocusNode.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageFocusNode.hasFocus) {
      setState(() {});
    }
  }

  void _saveForm() {
    final isValid = _formKey.currentState!.validate();
    final _productData = Provider.of<ProductProvider>(context, listen: false);
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    // if (_editedProduct.id != null) {
    //   _newProduct.updateProducts(_editedProduct.id, _editedProduct);
    // } else {
    //   _newProduct.addProduct(_editedProduct);
    // }
    print(' ${_newProduct.title} ${_newProduct.price} ');
    print(_newProduct.description);
    print(_newProduct.imageUrl);
    _productData.addProduct(_newProduct);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Products'),
      ),
      body: Padding(
        padding: EdgeInsets.all(13),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTitleInput(),
              _buildPriceInput(),
              _buildDescInput(),
              SizedBox(height: 12),
              // _buildInputImage(),
              SizedBox(height: 14),
              Container(
                child: ElevatedButton(
                  child: Text('Add Product'),
                  onPressed: () {
                    _saveForm();
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
        controller: _titleController,
        decoration: InputDecoration(labelText: 'Title'),
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_priceFocusNode);
        },
        onEditingComplete: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please provide a value';
          }
          return null;
        },
        onSaved: (value) {
          _newProduct = ProductModel(
            id: _newProduct.id,
            isFavourite: _newProduct.isFavourite,
            title: value!,
            price: _newProduct.price,
            description: _newProduct.description,
            imageUrl: _newProduct.imageUrl,
          );
        },
      );

  Widget _buildPriceInput() => TextFormField(
        controller: _priceController,
        decoration: InputDecoration(labelText: 'Price'),
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        focusNode: _priceFocusNode,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_descFocusNode);
        },
        onEditingComplete: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please provide a value';
          }
          if (double.tryParse(value) == null) {
            return 'Enter a valid number';
          }
          if (double.parse(value) <= 5.00) {
            return 'Minimum price is RM 5';
          }
          return null;
        },
        onSaved: (value) {
          _newProduct = ProductModel(
              id: _newProduct.id,
              isFavourite: _newProduct.isFavourite,
              title: _newProduct.title,
              price: double.parse(value!),
              description: _newProduct.description,
              imageUrl: _newProduct.imageUrl);
        },
      );

  Widget _buildDescInput() => TextFormField(
        controller: _descController,
        decoration: InputDecoration(labelText: 'Description'),
        maxLines: 3,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.multiline,
        focusNode: _descFocusNode,
        onEditingComplete: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter a description';
          }
          return null;
        },
        onSaved: (value) {
          _newProduct = ProductModel(
            id: _newProduct.id,
            isFavourite: _newProduct.isFavourite,
            title: _newProduct.title,
            price: _newProduct.price,
            description: value!,
            imageUrl: _newProduct.imageUrl,
          );
        },
      );

  Widget _buildInputImage() => Row(
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
              onFieldSubmitted: (_) => _saveForm(),
              onEditingComplete: () {
                FocusManager.instance.primaryFocus?.unfocus();
                setState(() {});
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter an image URL.';
                }
                if (!value.startsWith('http') && !value.startsWith('https')) {
                  return ' Enter a valid URL';
                }
                if (!value.endsWith('.png') &&
                    !value.endsWith('.jpg') &&
                    !value.endsWith('.jpeg')) {
                  return 'Enter a valid file';
                }
                return null;
              },
              onSaved: (value) {
                _newProduct = ProductModel(
                  id: _newProduct.id,
                  isFavourite: _newProduct.isFavourite,
                  title:_newProduct.title,
                  price: _newProduct.price,
                  description: _newProduct.description,
                  imageUrl: value!,
                );
              },
            ),
          )
        ],
      );
}
