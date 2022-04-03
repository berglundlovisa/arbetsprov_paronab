import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditParonklockaView extends StatefulWidget {
  const EditParonklockaView({Key? key}) : super(key: key);

  @override
  State<EditParonklockaView> createState() => _EditParonklockaViewState();
}

class _EditParonklockaViewState extends State<EditParonklockaView> {
  var num1 = 0, num2 = 0, sum = 0;

  final TextEditingController paronklockaController = TextEditingController();

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

  void _updateParonklockaQuantity() {
    final paronklockaQuantity = sum;

    FirebaseFirestore.instance
        .collection('products')
        .doc('KdWxwmT5HFeDUXv8a5g9')
        .update({'productquantity': paronklockaQuantity})
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.watch),
                Text(
                  ('Päronklocka'),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(height: 10),
            const Text('Product number: P003'),
            Container(height: 20),
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
          ],
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
}

 /*GestureDetector(
              onTap: () {},
              child: const Card(
                elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.warehouse),
                  title: Text('Cupertino'),
                  subtitle: Text('Stock balance: 96 000'),
                  trailing: Icon(Icons.edit),
                ),
              ),
            ),*/