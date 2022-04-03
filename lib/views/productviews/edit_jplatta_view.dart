import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditJPlattaView extends StatefulWidget {
  const EditJPlattaView({Key? key}) : super(key: key);

  @override
  State<EditJPlattaView> createState() => _EditJPlattaViewState();
}

class _EditJPlattaViewState extends State<EditJPlattaView> {
  var num1 = 0, num2 = 0, sum = 0;

  final TextEditingController jPlattaController = TextEditingController();

  //INLEVERANS JPLATTA
  void _addJplattaQuantity() async {
    var collection = FirebaseFirestore.instance.collection('products');
    var docSnapshot = await collection.doc('96KRbtxwn325mChmwDO3').get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      var jplattasavedquantity = data['productquantity'];

      setState(() {
        num1 = int.parse(jPlattaController.text);
        num2 = jplattasavedquantity;
        sum = num1 + num2;
      });
      _updateJPlattaQuantity();
      jPlattaController.clearComposing();
    }
  }

  //UTLEVERANS JPLATTA
  void _subtractJplattaQuantity() async {
    var collection = FirebaseFirestore.instance.collection('products');
    var docSnapshot = await collection.doc('96KRbtxwn325mChmwDO3').get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      var jplattasavedquantity = data['productquantity'];

      setState(() {
        num1 = int.parse(jPlattaController.text);
        num2 = jplattasavedquantity;
        sum = num2 - num1;
      });
      _updateJPlattaQuantity();
      jPlattaController.clearComposing();
    }
  }

  void _updateJPlattaQuantity() {
    final jPlattaQuantity = sum;

    FirebaseFirestore.instance
        .collection('products')
        .doc('96KRbtxwn325mChmwDO3')
        .update({'productquantity': jPlattaQuantity})
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.tablet),
                  Text(
                    ('JPlatta'),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(height: 10),
              const Text('Product number: P002'),
              Container(height: 20),
              editJPlattaField(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _addJplattaQuantity();
                      Navigator.pop(context);
                    },
                    child: const Text('Add quantity'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _subtractJplattaQuantity();
                        Navigator.pop(context);
                      },
                      child: const Text('Remove quantity'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget editJPlattaField() {
    return Container(
      margin: const EdgeInsets.all(1),
      padding: const EdgeInsets.all(10),
      child: TextField(
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        controller: jPlattaController,
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
}
