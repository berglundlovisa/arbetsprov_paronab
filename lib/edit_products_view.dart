import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditProductView extends StatefulWidget {
  const EditProductView({Key? key}) : super(key: key);

  @override
  State<EditProductView> createState() => _EditProductViewState();
}

class _EditProductViewState extends State<EditProductView> {
  final _JPlattacontroller = TextEditingController();
  final _ParonklockaController = TextEditingController();
  final _JTelefonController = TextEditingController();

  void _updateJPlattaQuantity() {
    final jPlattaQuantity = _JPlattacontroller.text;

    FirebaseFirestore.instance
        .collection('products')
        .doc('96KRbtxwn325mChmwDO3')
        .update({'productquantity': jPlattaQuantity})
        .then((value) => print('Product updated'))
        .catchError((error) => print('Failed to update product: $error'));
  }

  void _updateParonklockaQuantity() {
    final paronklockaQuantity = _ParonklockaController.text;

    FirebaseFirestore.instance
        .collection('products')
        .doc('KdWxwmT5HFeDUXv8a5g9')
        .update({'productquantity': paronklockaQuantity})
        .then((value) => print('Product updated'))
        .catchError((error) => print('Failed to update product: $error'));
  }

  void _updateJTelefonQuantity() {
    final jTelefonQuantity = _JTelefonController.text;

    FirebaseFirestore.instance
        .collection('products')
        .doc('ZNPanC1KAFUlWkGL5kOJ')
        .update({'productquantity': jTelefonQuantity})
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 200),
              margin: const EdgeInsets.only(top: 20),
              child: const Text('Edit quantity JPlatta',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            ),
            editJPlattaBox(),
            ElevatedButton(
              onPressed: () {
                _updateJPlattaQuantity();
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
            Container(
              padding: const EdgeInsets.only(right: 150),
              margin: const EdgeInsets.only(top: 20),
              child: const Text('Edit quantity Paronklocka',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            ),
            editParonklockaBox(),
            ElevatedButton(
              onPressed: () {
                _updateParonklockaQuantity();
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
            Container(
              padding: const EdgeInsets.only(right: 180),
              margin: const EdgeInsets.only(top: 20),
              child: const Text('Edit quantity JTelefon',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            ),
            editJTelefonBox(),
            ElevatedButton(
              onPressed: () {
                _updateJTelefonQuantity();
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Widget editJPlattaBox() {
    return Container(
      margin: const EdgeInsets.all(1),
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: _JPlattacontroller,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Colors.black),
          ),
          hintText: 'Enter new Jplatta quantity',
        ),
      ),
    );
  }

  Widget editParonklockaBox() {
    return Container(
      margin: const EdgeInsets.all(1),
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: _ParonklockaController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Colors.black),
          ),
          hintText: 'Enter new Päronklocka quantity',
        ),
      ),
    );
  }

  Widget editJTelefonBox() {
    return Container(
      margin: const EdgeInsets.all(1),
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: _JTelefonController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Colors.black),
          ),
          hintText: 'Enter new JTelefon quantity',
        ),
      ),
    );
  }
}
