import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model.dart';

class EditProductView extends StatelessWidget {
  final _controller = TextEditingController();

  void _updateProductQuantity() {
    final productQuantity = _controller.text;

    FirebaseFirestore.instance
        .collection('products')
        .doc('')
        .update({'productquantity': productQuantity})
        .then((value) => print('Task updated'))
        .catchError((error) => print('Failed to update task: $error'));
    /*
    final productName = _controller.text;

    FirebaseFirestore.instance
        .collection('products')
        .add({'name': productName});

    _controller.clear();*/
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
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
/*
 Future<void> updateTask(TaskItem task) {
    return FirebaseFirestore.instance
        .collection('TaskItem')
        .doc(task.id)
        .update({
          'title': task.title,
          'deadline': task.deadline,
          'description': task.description
        })
        .then((value) => print('Task updated'))
        .catchError((error) => print('Failed to update task: $error'));
  }
}*/


/*

class EditProductView extends StatefulWidget {
  final ProductItem product;
  const EditProductView(this.product);

  State<StatefulWidget> createState() {
    return EditProductViewState(product);
  }
}

class EditProductViewState extends State<EditProductView> {
  String? productquantity = '';

  TextEditingController productquantityController = TextEditingController();

  EditProductViewState(ProductItem product) {
    this.productquantity = product.productquantity;

    productquantityController.addListener(() {
      setState(() {
        productquantity = productquantityController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Uppdatera uppgift antal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height: 30),
            const Text(
              ('Edit stock balance JTelefon Cupertino'),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(height: 10),
            const Text('Stock balance Cupertino: 82 000'),
            Container(height: 20),
            editQuantityBox(),
          ],
        ),
      ),
    );
  }

  Widget editQuantityBox() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(1),
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: productquantityController,
            decoration: InputDecoration(
              hintText: 'Update stock balance Cupertino',
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green, width: 1.0),
                borderRadius: BorderRadius.circular(20.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green, width: 1.0),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ),
        Container(height: 10),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Save updated quantity'),
        ),
      ],
    );
  }
}*/
