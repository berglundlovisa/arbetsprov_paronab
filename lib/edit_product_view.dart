import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditProductView extends StatefulWidget {
  const EditProductView({Key? key}) : super(key: key);

  @override
  State<EditProductView> createState() => _EditProductViewState();
}

class _EditProductViewState extends State<EditProductView> {
  final _controller = TextEditingController();

  void _updateProductQuantity() {
    final productQuantity = _controller.text;

    FirebaseFirestore.instance
        .collection('products')
        .doc('96KRbtxwn325mChmwDO3')
        .update({'productquantity': productQuantity})
        .then((value) => print('Product updated'))
        .catchError((error) => print('Failed to update product: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Päron AB'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'Enter new product quantity',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _updateProductQuantity();
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
