// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart ';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_force/Models/ProductModel.dart';
import '../Providers/ProductsProvider.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';

  const EditProductScreen({Key? key}) : super(key: key);

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _imageUrlController = TextEditingController();
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _priceController = TextEditingController();
  final _priceFocusNode = FocusNode();
  final _descFocusNode = FocusNode();
  final _imageFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  var _editedProduct = ProductModel(
    id: null,
    title: '',
    description: '',
    price: 0,
    imageUrl: '',
  );
  // var _initValues = {
  //   'title': '',
  //   'description': '',
  //   'price': '',
  //   'imageUrl': '',
  // };
  // var _isInit = true;

  @override
  void initState() {
    // TODO: implement initState
    _imageFocusNode.addListener(_updateImageURl);
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   if (_isInit) {
  //     final productId = ModalRoute
  //         .of(context)!
  //         .settings
  //         .arguments
  //         .toString();
  //     if (productId != null) {
  //       _editedProduct = Provider.of<ProductProvider>(context, listen: false)
  //           .findById(productId);
  //       _initValues = {
  //         'title': _editedProduct.title,
  //         'description': _editedProduct.description,
  //         'price': _editedProduct.price.toString(),
  //         'imageUrl': '',
  //       };
  //       // _titleController.text =_editedProduct.title;
  //       // _descController.text = _editedProduct.description;
  //       // _priceController.text = _editedProduct.price.toString();
  //       _imageUrlController.text = _editedProduct.imageUrl;
  //     }
  //   }
  //   _isInit = false;
  //   super.didChangeDependencies();
  // }

  @override
  void dispose() {
    _imageFocusNode.removeListener(_updateImageURl);
    _priceFocusNode.dispose();
    _descFocusNode.dispose();
    _imageUrlController.dispose();
    _imageFocusNode.dispose();
    super.dispose();
  }

  void _updateImageURl() {
    if (!_imageFocusNode.hasFocus) {
      if ((!_imageUrlController.text.startsWith('http') &&
          !_imageUrlController.text.startsWith('https')) ||
          (!_imageUrlController.text.endsWith('.png') &&
              !_imageUrlController.text.endsWith('.jpg') &&
              !_imageUrlController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  void _saveForm() {
    final isValid = _formKey.currentState!.validate();
    final _newProduct = Provider.of<ProductProvider>(context, listen: false);
    if (isValid) {
      return;
    }
    _formKey.currentState!.save();
    if (_editedProduct.id != null) {
      _newProduct.updateProducts(_editedProduct.id, _editedProduct);
    } else {
      _newProduct.addProduct(_editedProduct);
    }
    print(' ${_editedProduct.title} ${_editedProduct.price} ');
    print(_editedProduct.description);
    print(_editedProduct.imageUrl);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                // initialValue: _initValues['title'],
                controller: _titleController,
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
                onSaved: (value) {
                  _editedProduct = ProductModel(
                      id: _editedProduct.id,
                      isFavourite: _editedProduct.isFavourite,
                      title: value!,
                      price: _editedProduct.price,
                      description: _editedProduct.description,
                      imageUrl: _editedProduct.imageUrl);
                },
              ),
              TextFormField(
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
                onSaved: (value) {
                  _editedProduct = ProductModel(
                      id: _editedProduct.id,
                      isFavourite: _editedProduct.isFavourite,
                      title: _editedProduct.title,
                      price: double.parse(value!),
                      description: _editedProduct.description,
                      imageUrl: _editedProduct.imageUrl);
                },
              ),
              TextFormField(
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
                onSaved: (value) {
                  _editedProduct = ProductModel(
                      id: _editedProduct.id,
                      isFavourite: _editedProduct.isFavourite,
                      title: _editedProduct.title,
                      price: _editedProduct.price,
                      description: value!,
                      imageUrl: _editedProduct.imageUrl);
                },
              ),
              SizedBox(height: 12),
              Row(
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
                      onSaved: (value) {
                        _editedProduct = ProductModel(
                          id: _editedProduct.id,
                          isFavourite: _editedProduct.isFavourite,
                          title: _editedProduct.title,
                          price: _editedProduct.price,
                          description: _editedProduct.description,
                          imageUrl: value!,
                        );
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
