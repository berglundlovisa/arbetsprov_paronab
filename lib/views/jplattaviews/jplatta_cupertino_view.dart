import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class JPlattaCupertinoView extends StatefulWidget {
  const JPlattaCupertinoView({Key? key}) : super(key: key);

  @override
  _JPlattaCupertinoViewState createState() => _JPlattaCupertinoViewState();
}

class _JPlattaCupertinoViewState extends State<JPlattaCupertinoView> {
  //variabler att använda för att beräkna nytt lagersaldo
  var num1 = 0, num2 = 0, sum = 0;

//texteditingcontroller för textfältet
  final TextEditingController jPlattaController = TextEditingController();

  //INLEVERANS JTELEFON
  void _addJPlattaQuantity() async {
    var collection = FirebaseFirestore.instance.collection('jPlatta');
    var docSnapshot = await collection.doc('jPlattaID').get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      var jplattasavedquantity = data['jPlattaCupertinoQuantity'];

      setState(() {
        num1 = int.parse(jPlattaController.text);
        num2 = jplattasavedquantity;
        sum = num1 + num2;
      });
      _updateJPlattaQuantity();
      jPlattaController.clearComposing();
    }
  }

  //UTLEVERANS JTELEFON
  void _subtractJPlattaQuantity() async {
    var collection = FirebaseFirestore.instance.collection('jPlatta');
    var docSnapshot = await collection.doc('jPlattaID').get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      var jplattasavedquantity = data['jPlattaCupertinoQuantity'];

      setState(() {
        num1 = int.parse(jPlattaController.text);
        num2 = jplattasavedquantity;
        sum = num2 - num1;
      });
      _updateJPlattaQuantity();
      jPlattaController.clearComposing();
    }
  }

//UPPDATERA LAGERSALDO
  void _updateJPlattaQuantity() {
    final jPlattaQuantity = sum;

    FirebaseFirestore.instance
        .collection('jPlatta')
        .doc('jPlattaID')
        .update({'jPlattaCupertinoQuantity': jPlattaQuantity})
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
                Icon(Icons.tablet),
                Text(
                  ('JPlatta'),
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
                    _addJPlattaQuantity();
                    Navigator.pop(context);
                  },
                  child: const Text('Add quantity'),
                ),
                ElevatedButton(
                    onPressed: () {
                      _subtractJPlattaQuantity();
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

//Textfält för att fylla i antal att ta bort/lägga till
  Widget editJTelefonField() {
    return Container(
      margin: const EdgeInsets.all(1),
      padding: const EdgeInsets.all(10),
      child: TextField(
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
          hintText: 'Enter quantity to add or remove',
        ),
      ),
    );
  }
}
