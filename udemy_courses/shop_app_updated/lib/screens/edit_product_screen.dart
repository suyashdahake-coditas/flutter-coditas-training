import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_updated/providers/product.dart';
import 'package:shop_app_updated/providers/products_provider.dart';
import 'package:shop_app_updated/widgets/app_drawer.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';

  const EditProductScreen({Key? key}) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusedNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  bool _isLoading = false;
  var _editedProduct = Product(
    id: '0',
    title: '',
    price: 0,
    description: '',
    imageUrl: '',
  );
  var _initValues = {
    'title': '',
    'price': '',
    'description': '',
    'imageUrl': '',
  };

  bool _isInit = true;

  @override
  void initState() {
    _imageUrlFocusNode.addListener(updateImageUrl);
    print('Hi');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('Hi');
    if (_isInit) {
      final productId = ModalRoute.of(context)?.settings.arguments;
      // print(productId);
      if (productId != null) {
        _editedProduct = Provider.of<ProductsProvider>(context, listen: false)
            .findById(productId as String);
        print(productId);
        _initValues = {
          'title': _editedProduct.title,
          'description': _editedProduct.description,
          'price': _editedProduct.price.toString(),
          // 'imageUrl': _editedProduct.imageUrl,
          // 'imageUrl': '',
        };
        _imageUrlController.text = _editedProduct.imageUrl;
      }
      print(productId);
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusedNode.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _saveForm() async {
    // var len = string?.length ?? 0;
    // print(isValid);
    final isValid = _form.currentState?.validate() ?? false;
    print(isValid);
    if (!isValid) {
      print(isValid);
      return;
    }
    print('Hi');
    _form.currentState?.save();
    setState(() {
      _isLoading = true;
    });
    // print(_editedProduct == '0');
    if (_editedProduct.id.isEmpty) {
      try {
        await Provider.of<ProductsProvider>(context, listen: false)
            .addProduct(_editedProduct);
      } catch (error) {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('An error occured!'),
            content: const Text(
              'Something went wrong.',
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Okay')),
            ],
          ),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
        Navigator.of(context).pop();
      }
    } else {
      Provider.of<ProductsProvider>(context, listen: false)
          .updateProduct(_editedProduct.id, _editedProduct);
      setState(() {
        _isLoading = true;
      });
      Navigator.of(context).pop();
      print(_isLoading);
    }
    setState(() {
      _isLoading = true;
    });
    // Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Products'),
        actions: [
          IconButton(
            onPressed: _saveForm,
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _form,
                child: ListView(
                  children: [
                    TextFormField(
                      initialValue: _initValues['title'],
                      decoration: const InputDecoration(
                        labelText: 'Title',
                      ),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter title';
                        }
                        return null;
                      },
                      // controller: _titleController,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_priceFocusNode);
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                          title: value!,
                          price: _editedProduct.price,
                          imageUrl: _editedProduct.imageUrl,
                          description: _editedProduct.description,
                          id: _editedProduct.id,
                          isFavourite: _editedProduct.isFavourite,
                        );
                      },
                    ),
                    TextFormField(
                      initialValue: _initValues['price'],
                      decoration: const InputDecoration(labelText: 'Price'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter price';
                        }
                        if (double.tryParse(value!) == null) {
                          return 'Enter valid price';
                        }
                        if (double.parse(value!) <= 0) {
                          return 'Enter price greater than 0';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      focusNode: _priceFocusNode,
                      onSaved: (value) {
                        _editedProduct = Product(
                            title: _editedProduct.title,
                            price: double.parse(value!),
                            imageUrl: _editedProduct.imageUrl,
                            description: _editedProduct.description,
                            id: '');
                      },
                    ),
                    TextFormField(
                      initialValue: _initValues['description'],
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.next,
                      focusNode: _descriptionFocusedNode,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter description';
                        }
                        if (value!.length < 10) {
                          return 'Should be atleast 10 characters';
                        }
                        return null;
                      },
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_descriptionFocusedNode);
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                            title: _editedProduct.title,
                            price: _editedProduct.price,
                            imageUrl: _editedProduct.imageUrl,
                            description: value!,
                            id: '');
                      },
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          margin: const EdgeInsets.only(
                            top: 8,
                            right: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                          ),
                          child: _imageUrlController.text.isEmpty
                              ? const Text('Enter a URL')
                              : FittedBox(
                                  child:
                                      Image.network(_imageUrlController.text),
                                ),
                        ),
                        Expanded(
                          child: TextFormField(
                            // initialValue: _initValues['imageUrl'],
                            controller: _imageUrlController,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.url,
                            decoration:
                                const InputDecoration(labelText: 'Image URL'),
                            focusNode: _imageUrlFocusNode,
                            onFieldSubmitted: (_) {
                              _saveForm();
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter image url';
                              }
                              if (!value!.startsWith('http') &&
                                  !value!.startsWith('https')) {
                                return 'Enter valid URL';
                              }
                              if (!value!.endsWith('jpg') &&
                                  !value!.endsWith('jpeg') &&
                                  !value!.endsWith('png')) {
                                return 'Enter valid URL';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _editedProduct = Product(
                                  title: _editedProduct.title,
                                  price: _editedProduct.price,
                                  imageUrl: value!,
                                  description: _editedProduct.description,
                                  id: '');
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
