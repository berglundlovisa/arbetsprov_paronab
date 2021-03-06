import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ParonklockaFrankfurtView extends StatefulWidget {
  const ParonklockaFrankfurtView({Key? key}) : super(key: key);

  @override
  _ParonklockaFrankfurtViewState createState() =>
      _ParonklockaFrankfurtViewState();
}

class _ParonklockaFrankfurtViewState extends State<ParonklockaFrankfurtView> {
  //variabler att använda för att beräkna nytt lagersaldo
  var num1 = 0, num2 = 0, sum = 0;

//texteditingcontroller för textfältet
  final TextEditingController paronklockaController = TextEditingController();

  //INLEVERANS JTELEFON
  void _addParonklockaQuantity() async {
    var collection = FirebaseFirestore.instance.collection('paronklocka');
    var docSnapshot = await collection.doc('paronklockaID').get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      var paronklockasavedquantity = data['paronklockaFrankfurtQuantity'];

      setState(() {
        num1 = int.parse(paronklockaController.text);
        num2 = paronklockasavedquantity;
        sum = num1 + num2;
      });
      _updateParonklockaQuantity();
      paronklockaController.clearComposing();
    }
  }

  //UTLEVERANS JTELEFON
  void _subtractParonklockaQuantity() async {
    var collection = FirebaseFirestore.instance.collection('paronklocka');
    var docSnapshot = await collection.doc('paronklockaID').get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      var paronklockasavedquantity = data['paronklockaFrankfurtQuantity'];

      setState(() {
        num1 = int.parse(paronklockaController.text);
        num2 = paronklockasavedquantity;
        sum = num2 - num1;
      });
      _updateParonklockaQuantity();
      paronklockaController.clearComposing();
    }
  }

//UPPDATERA LAGERSALDO
  void _updateParonklockaQuantity() {
    final paronklockaQuantity = sum;

    FirebaseFirestore.instance
        .collection('paronklocka')
        .doc('paronklockaID')
        .update({'paronklockaFrankfurtQuantity': paronklockaQuantity})
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
                  ('Päronklocka'),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(height: 10),
            const Text('Frankfurt warehouse'),
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
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

//Textfält för att fylla i antal att ta bort/lägga till
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
