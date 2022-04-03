import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'jplatta_cupertino_view.dart';
import 'jplatta_frankfurt_view.dart';
import 'jplatta_norrkoping_view.dart';

class JPlattaMainView extends StatefulWidget {
  const JPlattaMainView({Key? key}) : super(key: key);

  @override
  State<JPlattaMainView> createState() => _JPlattaMainViewState();
}

class _JPlattaMainViewState extends State<JPlattaMainView> {
  //variabler som används för att beräkna totalt lagersaldo
  var num1 = 0, num2 = 0, num3 = 0, sum = 0;

//funktion för att räkna ut totalt lagersaldo
  void calcTotalSumJPlatta() async {
    var collection = FirebaseFirestore.instance.collection('jPlatta');
    var docSnapshot = await collection.doc('jPlattaID').get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      var jplattasavedCupertinoquantity = data['jPlattaCupertinoQuantity'];
      var jplattasavedFrankfurtquantity = data['jPlattaFrankfurtQuantity'];
      var jplattasavedNorrkopingquantity = data['jPlattaNorrkopingQuantity'];

      if (!mounted) return; //ta bort om något knasar

      setState(() {
        num1 = jplattasavedNorrkopingquantity;
        num2 = jplattasavedCupertinoquantity;
        num3 = jplattasavedFrankfurtquantity;
        sum = num1 + num2 + num3;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    calcTotalSumJPlatta(); //lagersaldo räknas ut när sidan byggs upp
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
            const Text('Product number: P002'),
            Container(height: 20),
            Text(
              'Totalt lagersaldo: $sum ',
              style: const TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Container(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const JPlattaCupertinoView(),
                    ));
              },
              child: const Card(
                child: ListTile(
                  leading: Icon(Icons.warehouse),
                  title: Text('Cupertino'),
                  subtitle: Text('Edit stock balance'),
                  trailing: Icon(Icons.edit),
                ),
              ),
            ),
            Container(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const JPlattaFrankfurtView(),
                    ));
              },
              child: const Card(
                child: ListTile(
                  leading: Icon(Icons.warehouse),
                  title: Text('Frankfurt'),
                  subtitle: Text('Edit stock balance'),
                  trailing: Icon(Icons.edit),
                ),
              ),
            ),
            Container(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const JPlattaNorrkopingView(),
                    ));
              },
              child: const Card(
                child: ListTile(
                  leading: Icon(Icons.warehouse),
                  title: Text('Norrköping'),
                  subtitle: Text('Edit stock balance'),
                  trailing: Icon(Icons.edit),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
