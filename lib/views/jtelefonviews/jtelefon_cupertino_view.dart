import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class JTelefonCupertinoView extends StatefulWidget {
  const JTelefonCupertinoView({Key? key}) : super(key: key);

  @override
  _JTelefonCupertinoViewState createState() => _JTelefonCupertinoViewState();
}

class _JTelefonCupertinoViewState extends State<JTelefonCupertinoView> {
  var num1 = 0, num2 = 0, sum = 0;

  final TextEditingController jTelefonController = TextEditingController();

  //INLEVERANS JTELEFON
  void _addJTelefonQuantity() async {
    var collection = FirebaseFirestore.instance.collection('jTelefon');
    var docSnapshot = await collection.doc('jTelefonID').get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      var jtelefonsavedquantity = data['jTelefonCupertinoQuantity'];

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
    var collection = FirebaseFirestore.instance.collection('jTelefon');
    var docSnapshot = await collection.doc('jTelefonID').get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      var jtelefonsavedquantity = data['jTelefonCupertinoQuantity'];

      setState(() {
        num1 = int.parse(jTelefonController.text);
        num2 = jtelefonsavedquantity;
        sum = num2 - num1;
      });
      _updateJTelefonQuantity();
      jTelefonController.clearComposing();
    }
  }

  void _updateJTelefonQuantity() {
    final jTelefonQuantity = sum;

    FirebaseFirestore.instance
        .collection('jTelefon')
        .doc('jTelefonID')
        .update({'jTelefonCupertinoQuantity': jTelefonQuantity})
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
                Icon(Icons.smartphone),
                Text(
                  ('JTelefon'),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(height: 10),
            const Text('Cupertino warehouse'),
            Container(height: 20),
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
          hintText: 'Enter quantity to add or remove',
        ),
      ),
    );
  }
}
