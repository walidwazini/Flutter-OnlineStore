// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart ';
import 'package:shop_force/Models/ProductModel.dart';

import '../Providers/ProductsProvider.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';

  const EditProductScreen({Key? key}) : super(key: key);

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>(); // Allow us to interact with state
  var _edittedProduct = ProductModel(
    id: null,
    title: '',
    price: 0,
    imageUrl: '',
  );

  @override
  void initState() {
    // TODO: implement initState
    _imageFocusNode.addListener(_updateImageURl);
    super.initState();
  }

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
      setState(() {});
    }
  }

  void _saveForm() {
    _formKey.currentState!.save();
    print(_edittedProduct.title);
    print(_edittedProduct.price);
    print(_edittedProduct.description);
    print(_edittedProduct.imageUrl);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                onSaved: (value){
                  _edittedProduct = ProductModel(
                    id: null,
                    title: value!,
                    price: _edittedProduct.price,
                    description: _edittedProduct.description,
                    imageUrl: _edittedProduct.imageUrl
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descFocusNode);
                },
                onSaved: (value){
                  _edittedProduct = ProductModel(
                      id: null,
                      title: _edittedProduct.title,
                      price: double.parse(value!),
                      description: _edittedProduct.description,
                      imageUrl: _edittedProduct.imageUrl
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _descFocusNode,
                onSaved: (value){
                  _edittedProduct = ProductModel(
                      id: null,
                      title: _edittedProduct.title,
                      price: _edittedProduct.price,
                      description: value!,
                      imageUrl: _edittedProduct.imageUrl
                  );
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
                      decoration: InputDecoration(labelText: 'Image URL'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageUrlController,
                      focusNode: _imageFocusNode,
                      onFieldSubmitted: (_) => _saveForm(),
                      onSaved: (value){
                        _edittedProduct = ProductModel(
                            id: null,
                            title: _edittedProduct.title,
                            price: _edittedProduct.price,
                            description: _edittedProduct.description,
                            imageUrl: value!
                        );
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
