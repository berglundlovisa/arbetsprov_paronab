import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditProductView extends StatefulWidget {
  const EditProductView({Key? key}) : super(key: key);

  @override
  State<EditProductView> createState() => _EditProductViewState();
}

class _EditProductViewState extends State<EditProductView> {
  var num1 = 0, num2 = 0, sum = 0;

  final TextEditingController jPlattaController = TextEditingController();
  final TextEditingController paronklockaController = TextEditingController();
  final TextEditingController jTelefonController = TextEditingController();

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

//INLEVERANS PARONKLOCKA
  void _addParonklockaQuantity() async {
    var collection = FirebaseFirestore.instance.collection('products');
    var docSnapshot = await collection.doc('KdWxwmT5HFeDUXv8a5g9').get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      var paronklockasavedquantity = data['productquantity'];

      setState(() {
        num1 = int.parse(paronklockaController.text);
        num2 = paronklockasavedquantity;
        sum = num1 + num2;
      });
      _updateParonklockaQuantity();
      paronklockaController.clearComposing();
    }
  }

//UTLEVERANS PARONKLOCKA
  void _subtractParonklockaQuantity() async {
    var collection = FirebaseFirestore.instance.collection('products');
    var docSnapshot = await collection.doc('KdWxwmT5HFeDUXv8a5g9').get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      var paronklockasavedquantity = data['productquantity'];

      setState(() {
        num1 = int.parse(paronklockaController.text);
        num2 = paronklockasavedquantity;
        sum = num2 - num1;
      });
      _updateParonklockaQuantity();
      paronklockaController.clearComposing();
    }
  }

  //INLEVERANS JTELEFON
  void _addJTelefonQuantity() async {
    var collection = FirebaseFirestore.instance.collection('products');
    var docSnapshot = await collection.doc('ZNPanC1KAFUlWkGL5kOJ').get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      var jtelefonsavedquantity = data['productquantity'];

      setState(() {
        num1 = int.parse(jTelefonController.text);
        num2 = jtelefonsavedquantity;
        sum = num1 + num2;
      });
      _updateJTelefonQuantity();
      jTelefonController.clearComposing();
    }
  }

  //UTLEVERANS JTELEFON
  void _subtractJTelefonQuantity() async {
    var collection = FirebaseFirestore.instance.collection('products');
    var docSnapshot = await collection.doc('ZNPanC1KAFUlWkGL5kOJ').get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      var jtelefonsavedquantity = data['productquantity'];

      setState(() {
        num1 = int.parse(jTelefonController.text);
        num2 = jtelefonsavedquantity;
        sum = num2 - num1;
      });
      _updateJTelefonQuantity();
      jTelefonController.clearComposing();
    }
  }

  /*void dispose() {
    // Clean up the controller when the widget is disposed.
    jPlattaController.dispose();
    jTelefonController.dispose();
    paronklockaController.dispose();
    super.dispose();
  }*/

  void _updateJPlattaQuantity() {
    final jPlattaQuantity = sum;

    FirebaseFirestore.instance
        .collection('products')
        .doc('96KRbtxwn325mChmwDO3')
        .update({'productquantity': jPlattaQuantity})
        .then((value) => print('Product updated'))
        .catchError((error) => print('Failed to update product: $error'));
  }

  void _updateParonklockaQuantity() {
    final paronklockaQuantity = sum;

    FirebaseFirestore.instance
        .collection('products')
        .doc('KdWxwmT5HFeDUXv8a5g9')
        .update({'productquantity': paronklockaQuantity})
        .then((value) => print('Product updated'))
        .catchError((error) => print('Failed to update product: $error'));
  }

  void _updateJTelefonQuantity() {
    final jTelefonQuantity = sum;

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
            Container(
              padding: const EdgeInsets.only(right: 150),
              margin: const EdgeInsets.only(top: 20),
              child: const Text('Edit quantity Paronklocka',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            ),
            editParonklockaField(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _addParonklockaQuantity();
                    Navigator.pop(context);
                  },
                  child: const Text('Add quantity'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _subtractParonklockaQuantity();
                    Navigator.pop(context);
                  },
                  child: const Text('Remove quantity'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(right: 180),
              margin: const EdgeInsets.only(top: 20),
              child: const Text('Edit quantity JTelefon',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            ),
            editJTelefonField(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _addJTelefonQuantity();
                    Navigator.pop(context);
                  },
                  child: const Text('Add quantity'),
                ),
                ElevatedButton(
                    onPressed: () {
                      _subtractJTelefonQuantity();
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

  Widget editParonklockaField() {
    return Container(
      margin: const EdgeInsets.all(1),
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: paronklockaController,
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

  Widget editJTelefonField() {
    return Container(
      margin: const EdgeInsets.all(1),
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: jTelefonController,
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
